import Vue from 'vue'
import Router from 'vue-router'
import Accueil from '@/views/Accueil'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [{
      path: '/',
      redirect: '/accueil'
    }, {
      path: '/accueil',
      name: 'accueil',
      component: Accueil
    }, {
      path: '/connexion',
      name: 'connexion',
      component: () => import( /* webpackChunkName: "Connexion" */ './views/Connexion')
    },
    {
      path: '/edition/:id(\\d+)',
      name: 'edition',
      component: () => import( /* webpackChunkName: "Edition" */ './views/Edition')
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

  ]
})