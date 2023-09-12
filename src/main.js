import { createApp } from 'vue'
import App from './App.vue'

//import Bootstrap
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap/dist/js/bootstrap.min'
import 'bootstrap/dist/js/bootstrap.bundle.min'
import './assets/css/style-custom.css'
import "font-awesome/css/font-awesome.css";

//import router
import router from './router'

const app = createApp(App)

//use vue router
app.use(router)
app.mount('#app')