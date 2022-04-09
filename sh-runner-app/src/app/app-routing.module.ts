import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RunnerAuthComponent } from './runner-auth/runner-auth.component';
import { RunnerSetupComponent } from './runner-setup/runner-setup.component';

const routes: Routes = [
  { path: '', component: RunnerSetupComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
