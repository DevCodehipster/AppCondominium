import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

//Components Modulo de Messages "Comunicados"
import { MessagesComponent } from './components/messages/messages.component'
import { PrivateMessagesComponent } from './components/private-messages/private-messages.component'

//Components Login
import { SignupComponent } from './components/signup/signup.component'
import { SigninComponent } from './components/signin/signin.component'

//Components Modulo de Users "Usuarios"
import { UsersComponent } from './components/users/users.component'

//Components Modulo de Condominiums "Datos de bloques de casas o Edificios"
import { CondominiumsComponent } from './components/condominiums/condominiums.component'

//Components Modulo de Payment "Gastos/Pagos"
import { PaymentComponent } from './components/payment/payment.component';

//Components Modulo de Profile "Perfiles"
import { ProfileComponent } from './components/profile/profile.component';

//Components Modulo de Setting "Configuraciones"
import { SettingComponent } from './components/setting/setting.component';


//routes
const routes: Routes = [
  {
    path:'',
    redirectTo:'/messages',
    pathMatch:"full"
  },

  {
    path: 'messages',
    component: MessagesComponent
  },
  {
    path:'privateMessages',
    component:  PrivateMessagesComponent
  },
  {
    path:'singup',
    component:SignupComponent
  },
  {
    path:'singin',
    component: SigninComponent
  },
  {
    path:'users',
    component: UsersComponent
  },
  {
    path:'condominiums',
    component: CondominiumsComponent
  },
  {
    path:'payment',
    component: PaymentComponent
  },
  {
    path:'profile',
    component: ProfileComponent
  },
  {
    path:'setting',
    component: SettingComponent
  }
];



@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
