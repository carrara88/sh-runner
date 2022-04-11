import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators, FormBuilder } from '@angular/forms';
import { SetupService } from '../services/setup.service';

@Component({
  selector: 'app-runner-setup',
  templateUrl: './runner-setup.component.html',
  styleUrls: ['./runner-setup.component.scss']
})
export class RunnerSetupComponent implements OnInit {

  form: FormGroup;
  constructor(private formBuilder: FormBuilder, public setupService: SetupService) {
    this.form = this.formBuilder.group({
      repositories: this.formBuilder.group({
        sh_installer_git: ['https://github.com/carrara88/sh-installer', Validators.required],
        sh_installer_scripts_git: ['https://github.com/carrara88/sh-installer-scripts', Validators.required],
      }),
      instance: this.formBuilder.group({
        instance_name: ['instance-', Validators.required],
        instance_mode: ['server', Validators.required],
        instance_location: ['local', Validators.required],
        instance_domain: ['localhost', Validators.required],
      }),
      server: this.formBuilder.group({

      }),
      client: this.formBuilder.group({        
        server_address: ['http://localhost:5060'],
        server_username: ['administrator'],
        server_password: [''],

        client_address: ['localhost:5060', Validators.required],
      }),
      settings: this.formBuilder.group({
        username: [],
        password: [],
      }),
      modules: this.formBuilder.group({
        php: [],
        apache: [],
      }),
    });
  }

  submit() {
    console.log('reactive form submit', this.form.value);
  }
  ngOnInit(): void {
    let server = this.setupService.get('http://'+ self.location.host +':3001/server_status');
    server.subscribe(
      (data:any)=>{
        console.log('get server_status:', data);
      }
    );
    let server_info = this.setupService.get('http://'+ self.location.host +'/runner/sh-runner/server_info.json');
    server_info.subscribe(
      (data:any)=>{
        console.log('get server_info:', data);
      }
    );
  }

}
