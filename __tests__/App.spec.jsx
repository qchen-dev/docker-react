import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import App from '../src/App';

describe('App', () => {
  it('renders the app heading and welcome message', () => {
    render(<App />);

    const heading = screen.getByRole('heading', { name: /docker \+ react/i });
    const message = screen.getByText(/hello from docker react project/i);

    expect(heading).toBeInTheDocument();
    expect(message).toBeInTheDocument();
  });
});
