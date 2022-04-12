import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { SetupService } from '../services/setup.service';

@Component({
  selector: 'app-runner-auth',
  templateUrl: './runner-auth.component.html',
  styleUrls: ['./runner-auth.component.scss']
})
export class RunnerAuthComponent implements OnInit {

  openSignIn=true;
  form: FormGroup;

  constructor(private formBuilder: FormBuilder, public setupService: SetupService) {
    this.form = this.formBuilder.group({
      connection: this.formBuilder.group({
        host: [self.location.host, Validators.required],
        port: ['3001', Validators.required],
      }),
      signin:this.formBuilder.group({
        username: ['admin', Validators.required],
        password: ['', Validators.required],
      }),
    });
  }

  authenticate(){
    let server_auth = this.setupService.post(
      'http://'+ this.form.controls["connection"].value.host +':'+ this.form.controls["connection"].value.port +
      '/_request/server_signin',
      { 
        "username":this.form.controls["signin"].value.username, 
        "password":this.form.controls["signin"].value.password 
      });
    
    server_auth.subscribe(
      (data:any)=>{
        console.log('get authenticate:', data);
      }
    );
  }

  ngOnInit(): void {

  }

}
