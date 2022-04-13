import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { SetupService } from '../services/setup.service';

@Component({
  selector: 'app-runner-auth',
  templateUrl: './runner-auth.component.html',
  styleUrls: ['./runner-auth.component.scss']
})
export class RunnerAuthComponent implements OnInit {

  closableSignIn=false;
  openSignIn=true;
  form: FormGroup;
  server_info:any={
    user:"",
    loggable_users:[],
    all_users:[],
    installer_dir:"/var/www/sh-installer/installers",
    installers_extension:".installer.sh",
    installers:[],

  };
  loading=false;
  response:any=undefined;
  authenticated=false;
  connected=false;
  credentials:any={
    "username":"",
    "password":""
  }

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

  /**
   * Authentication POST [server_signin] request
   */
  authenticate(){
    this.loading=true;
    this.response="";
    let server_auth = this.setupService.post(
      'http://'+ this.form.controls["connection"].value.host +':'+ this.form.controls["connection"].value.port +
      '/_request/server_signin',
      { 
        "username":this.form.controls["signin"].value.username, 
        "password":this.form.controls["signin"].value.password 
      });
    
    server_auth.subscribe(
      (data:any)=>{
        this.loading=false;
        console.log('get authenticate:', data);
        if(data.body.authentication==true){
          this.authenticated=true;
          this.closableSignIn=true;
          this.credentials.username=this.form.controls["signin"].value.username;
          this.credentials.password=this.form.controls["signin"].value.password;
          this.response="Great! Ready to start!";
        }else{
          this.authenticated=false;
          this.closableSignIn=false;
          this.response="Ah ah ah! You didn't say the magic word!";
        }
        if(data.body.error!=undefined){
          this.authenticated=false;
          this.closableSignIn=false;
          this.response="Ah ah ah! You didn't say the magic word! #"+data.body.error;
        }
      },
      (error) => { 
        this.loading=false;
        this.response="Not Found.";
        this.authenticated=false;
      }
    );
  }

  /**
   * System GET [server_info] request
   */
  check_connection(){
    this.loading=true;
    this.response="";
    let server_info = this.setupService.get(
      'http://'+ this.form.controls["connection"].value.host +':'+ this.form.controls["connection"].value.port +
      '/request/server_info',
    );
    server_info.subscribe(
      (data:any)=>{
        console.log('get server_info:', data);
        if(data.body.loggable_users!=undefined){
          this.connected=true;
          this.server_info.loggable_users=data.body.loggable_users;
          this.response="Well done, connection established! Please Sign In!";
        }else{
          this.connected=false;
          this.response="Connection refused. Not found";
        }
        if(data.body.error!=undefined){
          this.connected=false;
          this.response="Connection refused. "+data.body.error;
        }
        this.loading=false;
      },
      (error) => { 
        this.loading=false;
        this.connected=false;
        this.response="Not Found.";
      }
    );
  }

  ngOnInit(): void {

  }

}
