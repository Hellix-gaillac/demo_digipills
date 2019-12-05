<template>
  <div class="edition">
    <div class="recherche">
      <div class="search">
        <input
          type="text"
          placeholder="Médicament.."
          size="30"
          v-model="searchMedoc"
          @keyup.enter="searchCis"
        />
        <button type="button" @click="searchCis">
          <i class="fas fa-search"></i>
        </button>
      </div>
    </div>
    <loader v-show="loader"></loader>
    <!-- {{ $route.params.id}} -->
    <div class="formulaire" v-if="tabSearch.length!=0&&!loader">
      <div class="choix">
        <input
          type="button"
          :class="{active : priseReg}"
          value="Prise régulière"
          @click.prevent="priseRegul"
        />
        <input
          type="button"
          :class="{active: priseOcc}"
          value="Prise occasionelle"
          @click.prevent="priseOccas"
        />
      </div>

      <form>
        <div class="item">
          <label>Choix de la référence:</label>
          <select v-model="selectCis">
            <option value>sélection :</option>
            <option
              v-for="choixCis in tabSearch"
              :key="choixCis.codeCIS"
              :value="choixCis.codeCIS"
            >{{choixCis.denomination}}</option>
          </select>
        </div>
        <div v-if="priseReg">
          <div class="item">
            <label for>Unité de dosage</label>
            <select v-model="unitDose" required>
              <option value>Choix</option>
              <option value="unité(s)">unité(s)</option>
              <option value="mg">mg</option>
              <option value="ml">ml</option>
            </select>
          </div>
          <div class="item">
            <label for>Nombre de prises :</label>
            <select v-model="selectNbPrise" @change="addDose(selectNbPrise)">
              <option value>Choix</option>
              <option value="1">1 prise / jour</option>
              <option value="2">2 prises / jour</option>
              <option value="3">3 prises / jour</option>
              <option value="4">4 prises / jour</option>
            </select>
          </div>
          <div
            class="item"
            v-for="(prise, i) in nbPrise"
            :key="i+1"
            v-show="unitDose&&selectNbPrise"
          >
            <p>Prise n° {{i+1}}</p>
            <label for>Heure</label>
            <input type="time" v-model="detailPrise.heure[i]" required value="07:00" />
            <label for>Dose en {{unitDose}}</label>
            <input type="number" v-model="detailPrise.dose[i]" required />
          </div>
          <!-- <div class="item">
            {{detailPrise}}
            <label for>Date de fin de prise</label>
            <input type="date" :min="minDate" v-model="dateFinPrise" />
          </div>-->
        </div>

        <div v-else>
          <div class="item">
            <label for>Ecart minimum entre chaque prise :</label>
            <br />
            <input type="time" v-model="ecartPrise" />
          </div>

          <div class="item">
            <label for>Unité de dosage</label>
            <select v-model="unitDose" required>
              <option value>Choix</option>
              <option value="unité(s)">unité(s)</option>
              <option value="mg">mg</option>
              <option value="ml">ml</option>
            </select>
          </div>
          <div class="item" v-show="unitDose">
            <p>Dose maximum par prise</p>
            <label for>Dose en {{unitDose}}</label>
            <input type="number" v-model="doseMax" required step="0.25" />
          </div>
        </div>
        <loader v-show="loaderSubmit"></loader>
        <div class="item-bp">
          <label></label>
          <input type="button" value="Annuler" @click.prevent="annulation" />
          <input type="submit" name="submit" value="Valider" @click.prevent="submitForm" />
        </div>
      </form>
    </div>
  </div>
</template>

<script>
//TODO: reload aprés ajout prise occasionnele au redirecto:index
//TODO: affichage input nbPrise avec un ajouter(+)
//TODO: verifier les infos du formulaire avant l'envoie du dataForm
//TODO:gerer le compte à rebour priseOcc, et fin d'ordonnance priseReg
import Etiquette from "@/components/Etiquette";
import Loader from "@/components/Loader";
import Search from "@/components/Search";

export default {
  data() {
    return {
      loader: false,
      loaderSubmit: false,
      msgSucces: "",
      msgError: "",
      priseOcc: false,
      priseReg: true,
      selectNbPrise: "",
      detailPrise: {
        heure: "",
        dose: ""
      },
      jsonMedoc: [],
      data: {},
      indicationsTherapeutiques: "",
      user: {},
      idPrise: null,
      searchMedoc: "",
      tabSearch: [],
      selectCis: "",
      unitDose: "",
      lien: "",
      notice: "",
      tabPrise: [],

      dateFinPrise: "",
      nbPrise: [],

      ecartPrise: "",
      doseMax: "",
      datePrise: ""
    };
  },
  components: {
    Search,
    Loader
  },
  mounted() {
    if (this.$route.params.id != 0) {
      this.idPrise = this.$route.params.id;
      this.chargerPrise(this.idPrise);
    } else {
      console.log("nouvel ajout");
      this.idPrise = 0;
    }
  },
  methods: {
    chargerPrise(idPrise) {
      this.loader = true;
      let formData = new FormData();
      let user = JSON.parse(localStorage.getItem("user"));
      formData.append("id_user", user.idUser);
      formData.append("token", user.token);
      let myHeaders = new Headers();
      myHeaders.append("Accept", "*/*");
      myHeaders.append("Content-Type", "text/plain");
      const URL = "../api/medication.php";
      let id_prise = `?id_prise=${this.idPrise}`;
      fetch(URL + id_prise, {
        method: "POST",
        header: myHeaders,
        body: formData
      })
        .then(response => {
          response.json().then(json => {
            if (json.ok) {
              console.log(json);
              this.searchMedoc = json.data.denomination;
              this.unitDose = json.data.unite_dosage;
              this.selectCis = json.data.code_cis;
              let modifPrise = {
                codeCIS: this.selectCis,
                denomination: this.searchMedoc
              };
              this.tabSearch.push(modifPrise);
              if (json.data.occasionnelle) {
                this.priseOccas();
                this.doseMax = json.data.tabPrise.dose_max;
                this.ecartPrise = json.data.tabPrise.heure_entre_prises;
              } else if (json.data.reguliere) {
                this.priseRegul();
                this.selectNbPrise = json.data.tabPrise.length;
                this.nbPrise = json.data.tabPrise.length;
                this.addDose(this.nbPrise);
              }
              // this.searchMedoc = json.denomination;
              // if (json.reguliere) {
              // } else if (json.occasionnelle) {
              // }
              // this.selectCis = json.code_cis;
              // this.tabSearch.push(this.selectCis);
            } else {
              console.log("Erreur dans la requête!");
            }
            this.loader = false;
          });
        })
        .catch(error => {
          console.log("Message d'erreur  :" + error.message);
        });
    },
    minDate() {
      let now = new Date();
      nowYear = now.getFullYear();
      nowMonth = now.getMonth() + 1;
      nowDay = now.getDate();

      nowDate = nowDay + "-" + nowMonth + "-" + nowYear;
      return nowDate;
    },
    annulation() {
      this.$router.push({ name: "accueil" });
    },
    addDose(selectNbPrise) {
      this.nbPrise = [];
      this.detailPrise = {
        heure: [],
        dose: []
      };
      let prise = {};
      for (let i = 0; i < selectNbPrise; i++) {
        this.nbPrise.push(prise);
      }
    },
    priseRegul() {
      this.priseOcc = false;
      this.priseReg = true;
    },
    priseOccas() {
      this.priseOcc = true;
      this.priseReg = false;
    },
    searchCis() {
      this.loader = true;
      const PROXY = "https://cors-anywhere.herokuapp.com/";
      const URL = "https://www.open-medicaments.fr/api/v1/medicaments?query=";
      fetch(PROXY + URL + this.searchMedoc)
        .then(response => {
          response
            .json()
            .then(json => {
              if (json.length == 0) {
                //TODO: afficher le message d'erreur
                console.log(
                  "Pas de résultat : vérifier l'ortographe ou médicament inexistant "
                );
              }
              this.tabSearch = [];
              this.tabSearch = json;
              this.loader = false;
            })
            .catch(e => {
              console.log(
                "Message d'erreur dans searchCis reception json: " +
                  error.message
              );
            });
        })
        .catch(error => {
          console.log("Message d'erreur : " + error.message);
        });
    },
    submitForm() {
      this.loaderSubmit = true;
      const PROXY = "https://cors-anywhere.herokuapp.com/";
      const URL = "https://www.open-medicaments.fr/api/v1/medicaments/";
      fetch(PROXY + URL + this.selectCis)
        .then(response => {
          response.json().then(json => {
            this.postForm(this.createFormData(json));
            this.loaderSubmit = false;
            this.$router.push({ name: "accueil" });
            //TODO: message
            //TODO: redirection accueil
          });
        })

        .catch(error => {
          console.log("Message d'erreur selectCis: " + error.message);
        });
    },
    createFormData(json) {
      let formData = new FormData();
      let user = JSON.parse(localStorage.getItem("user"));
      formData.append("id_user", user.idUser);
      formData.append("token", user.token);
      formData.append("id_prise", this.idPrise);
      formData.append("code_cis", json.codeCIS);
      formData.append("denomination", json.denomination);
      this.notice = this.extractNotice(json.indicationsTherapeutiques);
      // this.lien = this.extractLink(json.indicationsTherapeutiques);
      formData.append("notice", this.notice);
      formData.append("lien", this.lien);
      formData.append("unite_dosage", this.unitDose);
      if (this.priseReg) {
        formData.append("reguliere", true);
        let tableauPrise = this.createTabPrise(this.detailPrise);
        formData.append("tabPrise", JSON.stringify(tableauPrise));
      } else if (this.priseOcc) {
        formData.append("occasionnelle", true);
        formData.append("dose_max", this.doseMax);
        formData.append("heure_entre_prises", this.ecartPrise);
      }
      formData.append("submit", true);
      console.log(...formData);
      return formData;
    },
    createTabPrise(detailPrise) {
      let tableauPrises = [];
      if (this.priseReg) {
        for (let i = 0; i < detailPrise.heure.length; i++) {
          let prise = {};
          prise.id_prise = this.idPrise;
          prise.heure = detailPrise.heure[i];
          prise.dose = detailPrise.dose[i];
          tableauPrises.push(prise);
        }
      } else if (this.priseOcc) {
        let prise = {};
        prise.id_prise = this.idPrise;
        prise.dose_max = this.doseMax;
        prise.heure_entre_prise = this.ecartPrise;
      }
      return tableauPrises;
    },
    extractNotice(noticeText) {
      let laNotice = noticeText.replace(/<i[^>]+> ([^<]+)<\/i>/gi, "");
      laNotice = laNotice.replace(/(<([^>]+)>)/gi, "");
      if (laNotice.indexOf("Plus d'information en cliquant ici") >= 0) {
        laNotice = laNotice.replace("Plus d'information en cliquant ici", "");
      }
      return laNotice;
    },
    formTabPrise() {
      let prise = {};
      let listePrise = [];
      // if (this.priseReg) {
      for (let i in this.detailPrise.dose) {
        prise.priseReg = true;
        prise.heure = this.detailPrise.heure[i];
        prise.dose = this.detailPrise.dose[i];
        this.tabPrise.push(prise);
      }
    },
    postForm(formData) {
      let myHeaders = new Headers();
      myHeaders.append("Accept", "*/*");
      myHeaders.append("Content-Type", "text/plain");
      fetch("/api/medication.php", {
        method: "POST",
        header: myHeaders,
        body: formData
      })
        .then(response => {
          console.log("formulaire envoyé");
          response.json().then(json => {
            console.log(json);
            console.log("confirmation reception");
          });
        })
        .catch(error => {
          console.log("Message d'erreur envoie formulaire:" + error.message);
        });
    }
  }
};
</script>

<style>
</style>
