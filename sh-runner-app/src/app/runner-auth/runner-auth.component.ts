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
      host: [self.location.host, Validators.required],
      port: ['3001', Validators.required],
      username: ['admin', Validators.required],
      password: ['', Validators.required],
    });
  }

  authenticate(){
    let server_auth = this.setupService.get('http://'+ self.location.host +':3001/server_signin/'+this.form.controls["username"].value+"/"+this.form.controls["password"].value);
    server_auth.subscribe(
      (data:any)=>{
        console.log('get authenticate:', data);
      }
    );
  }

  ngOnInit(): void {

  }

}
