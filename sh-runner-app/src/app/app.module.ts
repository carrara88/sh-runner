import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ClarityModule } from '@clr/angular';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { RunnerAuthComponent } from './runner-auth/runner-auth.component';
import { RunnerCheckupComponent } from './runner-checkup/runner-checkup.component';
import { RunnerSetupComponent } from './runner-setup/runner-setup.component';

@NgModule({
  declarations: [
    AppComponent,
    RunnerAuthComponent,
    RunnerCheckupComponent,
    RunnerSetupComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    ClarityModule,
    FormsModule, ReactiveFormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
