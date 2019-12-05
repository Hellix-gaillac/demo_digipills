import Vue from 'vue'
import Router from 'vue-router'
// import Accueil from '@/views/Accueil.vue'
// import Connexion from '@/views/Connexion.vue'
// import Edition from '@/views/Edition.vue'


Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [{
      path: '/',
      redirect: '/accueil'
    }, {
      path: '/accueil',
      name: 'accueil',
      component: () => import( /* webpackChunkName: "Accueil" */ '@/views/Accueil')
    },
    {
      path: '/connexion',
      name: 'connexion',
      component: () => import( /* webpackChunkName: "Connexion" */ '@/views/Connexion')
    },
    {
      path: '/edition/:id(\\d+)',
      name: 'edition',
      component: () => import( /* webpackChunkName: "Edition" */ '@/views/Edition')
    }
    //, {
    //   path: '/historique',
    //   name: 'historique',
    //   component: () => import( /* webpackChunkName: "Historique" */ './views/Historique')
    //    
    // }, {
    //   path: '/notice',
    //   name: 'notice',
    // component: () => import( /* webpackChunkName: "Notice" */ './views/Notice')
    // }
    , {
      path: '*',
      redirect: '/'
    }
    //   // route level code-splitting
    //   // this generates a separate chunk (about.[hash].js) for this route
    //   // which is lazy-loaded when the route is visited.
    //   component: () => import( /* webpackChunkName: "about" */ './views/About.vue')
    // component: () => import( /* webpackChunkName: "Edition" */ './views/Edition')
  ]
})
