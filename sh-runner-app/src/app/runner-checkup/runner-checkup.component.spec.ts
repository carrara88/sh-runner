import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RunnerCheckupComponent } from './runner-checkup.component';

describe('RunnerCheckupComponent', () => {
  let component: RunnerCheckupComponent;
  let fixture: ComponentFixture<RunnerCheckupComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RunnerCheckupComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RunnerCheckupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
