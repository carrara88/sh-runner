import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RunnerAuthComponent } from './runner-auth.component';

describe('RunnerAuthComponent', () => {
  let component: RunnerAuthComponent;
  let fixture: ComponentFixture<RunnerAuthComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RunnerAuthComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RunnerAuthComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
