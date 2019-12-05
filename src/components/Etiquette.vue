<template>
  <div>
    <div class="detail" v-if="detailPrise.trie">
      <div class="contenair" v-for="(detail,i) in detailPrise.tabPrise" :key="i">
        <div class="content">
          <div class="denomination">{{detailPrise.denomination}}</div>
          <div>
            <div
              class="dosage-occas"
            >Dosage maximun : {{detail.dose_max.replace(/\.00$/,'')}} {{detailPrise.unite_dosage}}</div>
            <div
              class="ecart-prise"
            >écart minimum entre prise: {{detail.heure_entre_prises.replace(/\:00$/,'')}} h</div>
          </div>
        </div>
        <div class="button-notice" @click.prevent="notice" v-show="detailPrise.notice">
          <a>
            <img src="@/assets/ico/notice.png" height="32" width="32" alt />
          </a>
        </div>
      </div>
      <div class="time">
        <div class="start-prise">
          <img src="@/assets/ico/start-g.png" height="32" width="32" @click="startTimer" />
          <!-- <p>Compte à rebourd entre prise :</p> -->
          <!-- <timer :time="detailPrise.tabPrise[0].heure_entre_prises"></timer>-->
        </div>
      </div>
    </div>

    <div class="detail" v-else>
      <div class="contenair">
        <div class="content">
          <div class="denomination">{{detailPrise.denomination}}</div>
          <div class="dosage-regu">Dosage en : {{detailPrise.unite_dosage}}</div>
        </div>
        <!-- //TODO: boutton notice dans boucleDetail -->
        <div class="button-notice" @click.prevent="notice" v-show="detailPrise.notice">
          <img src="@/assets/ico/notice.png" height="32" width="32" alt />
        </div>
      </div>
      <div class="boucleDetail" v-for="(detail,i) in detailPrise.tabPrise" :key="i">
        <div class="detail-column">
          <p>{{detail.heure.replace(/:/,'h')}}, {{detail.dose.replace(/\.00$/,'')}} {{detailPrise.unite_dosage}}</p>
        </div>
      </div>
    </div>
    <transition name="animation">
      <div class="notice" v-show="showNotice">
        <!-- voir pour modif des o en li -->
        <div v-html="detailPrise.notice"></div>
        <i>
          <a
            :href="'http://base-donnees-publique.medicaments.gouv.fr/affichageDoc.php?specid=' + detailPrise.code_cis +'&typedoc=R'"
            target="_blank"
          >=> Plus d'informations</a>
        </i>
      </div>
    </transition>
    <transition name="animation">
      <div class="editer-supprimer" v-show="showEdit">
        <div class="supprimer">
          <img
            src="@/assets/ico/supp.png"
            height="32"
            width="32"
            alt
            @click.prevent="supprimerPrise(detailPrise.id_prise)"
          />
        </div>
        <div class="editer">
          <img
            src="@/assets/ico/edit-g.png"
            height="32"
            width="32"
            alt
            @click.prevent="editerPrise(detailPrise.id_prise)"
          />
        </div>
      </div>
    </transition>
  </div>
</template>


<script>
import store from "@/store/Store";
import Loader from "@/components/Loader";

export default {
  store: store,
  props: {
    detailPrise: Object
  },
  computed: {
    showEdit() {
      return this.$store.getters.doneShowEdit;
    }
  },
  data() {
    return { showNotice: false, lien: "", timer: false, i: 0 };
  },
  mounted() {
    this.timer = false;
  },
  methods: {
    forceRerender() {
      this.componentKey += 1;
    },
    startTimer() {},
    notice() {
      this.showNotice = !this.showNotice;
      this.lien =
        "http://base-donnees-publique.medicaments.gouv.fr/affichageDoc.php?specid=" +
        this.detailPrise.code_cis +
        "&typedoc=R";
    },
    supprimerPrise(idPrise) {
      if (confirm(`Vraiment supprimer ${this.detailPrise.denomination}? `)) {
        fetch(`/api/supprimer.php?id_prise=` + idPrise)
          .then(response => {
            response.json().then(json => {
              if (json.ok) {
                this.$router.push({ name: "accueil" });
              } else {
                console.log("Erreur dans la Suppression!");
              }
            });
          })
          .catch(error => {
            console.log("Message d'erreur Suppression:" + error.message);
          });
      }
    },
    editerPrise(idPrise) {
      this.$router.push({ path: `/edition/${idPrise}` });
    }
  }
};
</script>
<style>
</style>

