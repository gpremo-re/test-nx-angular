import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { TestLibComponent } from '@test-nx-angular/test-lib';
import { NxWelcomeComponent } from './nx-welcome.component';

@Component({
  standalone: true,
  imports: [NxWelcomeComponent, RouterModule, TestLibComponent],
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
})
export class AppComponent {
  title = 'test-nx-angular';
}
