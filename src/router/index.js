//import vue router
import { createRouter, createWebHistory } from 'vue-router'

//define a routes
const routes = [
    {
        path: '/',
        name: 'form',
        component: () => import('@/views/Form.vue')
    },
    {
        path: '/daftar-peserta',
        name: 'DaftarPeserta',
        component: () => import('@/views/DaftarPeserta.vue')
    },
    {
        path: '/sponsor/:_id',
        name: 'Sponsor',
        component: () => import('@/views/Sponsor.vue')
    }
]

//create router
const router = createRouter({
    history: createWebHistory(),
    routes  // config routes
})

export default router