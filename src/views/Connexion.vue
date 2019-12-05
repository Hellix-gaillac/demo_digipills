<template>
  <div>
    <div class="formulaire" v-show="!ifUserSession">
      <div class="choix">
        <input
          type="button"
          class="connexion"
          :class="{active : login}"
          value="Connexion"
          @click.prevent="connect"
        />
        <input
          type="button"
          class="inscription"
          :class="{active: registration}"
          value="Inscription"
          @click.prevent="register"
        />
      </div>
      <form>
        <div class="item">
          <label for>Pseudo :</label>
          <br />
          <input type="text" maxlength="10" required="required" v-model="log" />
        </div>
        <div class="item">
          <label for>Mot de Passe :</label>
          <br />
          <input type="password" maxlength="10" required="required" v-model="mdp" />
        </div>
        <transition name="animation">
          <div class="register" v-show="registration">
            <div class="inscription">
              <div class="item">
                <span>
                  <i class="far fa-check-square" v-if="mdpOk"></i>
                  <i class="far fa-window-close" v-else></i>
                </span>
                <label for>Confirmer mot de passe :</label>
                <br />
                <input
                  type="password"
                  maxlength="10"
                  required="required"
                  v-model="mdpConfirm"
                  :keyup="confirmationMdp()"
                />
              </div>
              <div class="item">
                <label for>Nom :</label>
                <br />
                <input type="text" maxlength="50" v-model="nom" />
              </div>
              <div class="item">
                <label for>Prénom :</label>
                <br />
                <input type="text" maxlength="50" v-model="prenom" />
              </div>
              <div class="item">
                <label for>Email :</label>
                <br />
                <input type="email" maxlength="50" v-model="email" />
              </div>
            </div>
          </div>
        </transition>

        <div class="item-bp">
          <label></label>
          <input type="button" value="Annuler" @click.prevent="annulation" />
          <input
            type="submit"
            name="submit"
            value="Valider"
            @click.prevent="submitLog"
            v-if="login||(register&&mdpOk)"
          />
          <input
            type="submit"
            name="submit"
            value="Suppression du Compte"
            @click.prevent="supprimerUser()"
            v-if="login"
          />
        </div>
      </form>
    </div>
  </div>
</template>

<script>
//TODO: gerer si session=> bouton suppression de compte
//TODO: gerer si session=> bouton deconnexion
import store from "@/store/Store";
export default {
  store: store,
  name: "connexion",
  data() {
    return {
      log: "",
      mdp: "",
      mdpConfirm: "",
      mdpOk: false,
      nom: "",
      prenom: "",
      email: "",
      userSession: false,
      login: true,
      registration: false,
      supprimUser: false
    };
  },
  computed: {
    showEdit() {
      return this.$store.getters.doneShowEdit;
    },
    ifUserSession() {
      return this.$store.getters.doneUserSession;
    }
  },
  methods: {
    connectUser(user) {
      store.commit("CONNECT", user);
      let userConnect = JSON.stringify(user);
      localStorage.setItem("user", userConnect);
    },
    supprimerUser() {
      console.log("Supprimer le compte");
      //TODO: supprimer le compte

      // fetch("http://localhost/sites/dgp/api/logout.php")
      //   .then(response => {
      //     console.log("logout envoyé");
      //     response.json().then(json => {
      //       console.log(json);
      //       console.log("confirmation reception logout");
      //       if (json.ok) {
      //         // this.$router.push({ name: "accueil" });
      //       }
      //     });
      //   })
      //   .catch(error => {
      //     console.log("Message d'erreur envoie formulaire:" + error.message);
      //   });
    },
    submitLog() {
      this.loader = true;
      let formData = new FormData();
      formData.append("log", this.log);
      formData.append("mdp", this.mdp);
      if (this.login) {
        formData.append("login", true);
      } else {
        formData.append("register", true);
        formData.append("nom", this.nom);
        formData.append("prenom", this.prenom);
        formData.append("email", this.email);
      }
      formData.append("submit", true);

      let myHeaders = new Headers();
      myHeaders.append("Accept", "*/*");
      myHeaders.append("Content-Type", "application/json");
      console.log(...formData);

      fetch("/api/login.php", {
        method: "POST",
        header: myHeaders,
        body: formData
      })
        .then(response => {
          console.log("formulaire envoyé");
          response.json().then(json => {
            console.log(json);
            console.log("confirmation reception");
            if (json.ok) {
              this.connectUser(json.user);
              this.$router.push({ name: "accueil" });
            }
          });
        })
        .catch(error => {
          console.log("Message d'erreur envoie formulaire:" + error.message);
        });
    },
    register() {
      this.registration = true;
      this.login = false;
    },
    connect() {
      this.registration = false;
      this.login = true;
    },
    annulation() {
      document.location.reload(true);
    },
    confirmationMdp() {
      this.mdp === this.mdpConfirm ? (this.mdpOk = true) : (this.mdpOk = false);
    }
  }
};
</script>

