import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-runner-auth',
  templateUrl: './runner-auth.component.html',
  styleUrls: ['./runner-auth.component.scss']
})
export class RunnerAuthComponent implements OnInit {

  openSignIn=true;
  form: FormGroup;
  constructor(private formBuilder: FormBuilder) {
    this.form = this.formBuilder.group({
      host: [self.location.host+':3001', Validators.required],
      username: ['admin', Validators.required],
      password: ['instance-', Validators.required],
    });
  }

  ngOnInit(): void {
  }

}
