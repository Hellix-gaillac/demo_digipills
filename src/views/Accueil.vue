<template>
  <div class="liste-prises">
    <div class="unlog" v-if="!userSession">
      Bonjour,
      <br />cette application va vous aider dans la prise de médicaments.
      <br />Veuillez vous connecter..
    </div>
    <div
      class="vide"
      v-if="userSession&&(tabPrises.length===0)"
    >Vous n'avez pas encore enregistré de prises</div>
    <div class="prise" v-for="(prise,i) in tabPrises" :key="prise[i]">
      <etiquette :detail-prise="prise"></etiquette>
    </div>
    <loader v-show="loader"></loader>
    <!-- <div class="searchNotice" v-show="showSearchNotice">
      <search></search>
    </div>-->
  </div>
</template>

<script>
//TODO: mettre le composant SearchNotice
import store from "@/store/Store";
import Loader from "@/components/Loader";
import Search from "@/components/Search";
import Etiquette from "@/components/Etiquette";

export default {
  name: "Accueil",
  store: store,
  data() {
    return {
      user: {},
      loader: false,
      tabPrises: [],
      cisNotice: "",
      notice: "",
      session: false
    };
  },
  mounted() {
    this.user = JSON.parse(localStorage.getItem("user"));
    if (this.user) {
      store.commit("CONNECT", this.user);
      this.getPrises();
    }
  },
  components: {
    Etiquette,
    Loader,
    Search
  },
  methods: {
    getPrises() {
      this.loader = true;
      let formData = new FormData();
      formData.append("token", this.user.token);
      let myHeaders = new Headers();
      myHeaders.append("Accept", "*/*");
      myHeaders.append("Content-Type", "application/json");
      // console.log(...formData);

      fetch(`/api/medication.php?id_user=${this.user.idUser}`, {
        method: "POST",
        header: myHeaders,
        body: formData
      })
        .then(response => {
          response.json().then(json => {
            console.log(json);
            if (json.ok) {
              this.tabPrises = json.data;
              if (this.tabPrises.length == 0) {
                console.log("Pas encore de médicament enregistré!");
              }
            } else {
              console.log("Erreur dans la requête!");
            }
            this.loader = false;
          });
        })
        .catch(error => {
          console.log("Message d'erreur  :" + error.message);
        });
    }
  },
  computed: {
    userSession() {
      if (this.$store.getters.doneConnect) {
        return true;
      } else {
        this.tabPrises = [];
        return false;
      }
    }
  }
};
</script>

