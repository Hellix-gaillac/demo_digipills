<template>
  <div>
    <div class="recherche">
      <div class="search">
        <input
          type="text"
          placeholder="Recherche..."
          size="30"
          v-model="searchMedoc"
          @keyup.enter="searchCis"
        />
        <button type="button" @click="searchCis">
          <i class="fas fa-search"></i>
        </button>
      </div>
    </div>
    <div class="item">
      <label>Choix de la référence:</label>
      <select v-model="selectCis">
        <option
          v-for="choixCis in tabSearch"
          :key="choixCis.codeCIS"
          :value="choixCis.codeCIS"
        >{{choixCis.denomination}}</option>
      </select>
    </div>
    <div class="contenair">
      <div class="notice" v-show="selectCis">
        {{notice}}
        <br />
        <!-- TODO: "Plus d'information" à enlever suivant le json de la bdd-->
        <i>
          <a
            :href="'http://base-donnees-publique.medicaments.gouv.fr/affichageDoc.php?specid=' + cisNotice +'&typedoc=R'"
            target="_blank"
          >=> Voir la notice sur base-donnees-publique.medicaments.gouv.fr</a>
        </i>
      </div>
    </div>

    <loader v-show="loader"></loader>
  </div>
</template>

<script>
import Loader from "@/components/Loader";

export default {
  name: "Search",
  components: { Loader },
  data() {
    return {
      loader: false,
      searchMedoc: "Doliprane",
      tabSearch: [],
      selectCis: "",
      notice:"",
    };
  },
  methods: {
    searchCis() {
      this.loader = true;
      const PROXY = "https://cors-anywhere.herokuapp.com/";
      const URL = "https://www.open-medicaments.fr/api/v1/medicaments?query=";
      let myHeaders = new Headers();
      myHeaders.append("Accept", "*/*");
      myHeaders.append("Content-Type", "text/plain");
      let init = {
        mode: "no-cors",
        method: "GET",
        headers: myHeaders
      };
      fetch(PROXY + URL + this.searchMedoc)
        .then(response => {
          response.json().then(json => {
            console.log(json);
            this.tabSearch = [];
            this.tabSearch = json;
            this.loader = false;
          });
        })

        .catch(error => {
          console.log("Message d'erreur : " + error.message);
        });
    }
  }
};
</script>
