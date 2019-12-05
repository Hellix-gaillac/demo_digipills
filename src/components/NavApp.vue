<template>
  <nav>
    <!-- <div class="case">
       <a class="a-link" v-if="['accueil'].includes($route.name)">
        <img src="@/assets/ico/nav/notice.png" height="42" width="42" alt />
      </a>
    </div>-->
    <div class="case" v-if="['accueil'].includes($route.name)&&userSession">
      <a class="a_link" @click.prevent="divEdit">
        <img src="@/assets/ico/nav/modifier.png" height="42" width="42" alt />
      </a>
    </div>
    <div class="case" v-if="['accueil'].includes($route.name)&&userSession">
      <router-link :to="{name:'edition',params:{id:0}}" class="a-link">
        <img src="@/assets/ico/nav/ajouter.png" height="42" width="42" alt />
      </router-link>
    </div>
    <div class="case">
      <router-link to="/" class="a-link">
        <img src="@/assets/ico/nav/homepage.png" height="42" width="42" alt />
      </router-link>
    </div>
  </nav>
</template>

<script>
//TODO: si searchNotice=> mettre le liens
import store from "@/store/Store";
export default {
  store: store,
  methods: {
    divEdit() {
      store.commit("CHANGE_EDIT");
    }
  },
  computed: {
    userSession() {
      return this.$store.getters.doneConnect;
    }
  }
};
</script>
