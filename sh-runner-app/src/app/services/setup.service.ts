import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class SetupService {


  constructor(private http: HttpClient) {   }

  public get (endpoint:string) {  
      return this.http.get <any> (endpoint, { 
          headers: new HttpHeaders({ 'Content-Type': 'application/json'  }),
          observe: 'response',
          responseType: "json",
          //withCredentials: true
      });
  }
}
