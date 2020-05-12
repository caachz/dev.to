import { h, render } from 'preact';

function loadElement() {
  const root = document.getElementById('suggested_videos');
  if (root) {
    render(
      <h1 className="container">Video Content Will go here</h1>,
      root,
      root.firstElementChild,
    );
  }
}

window.InstantClick.on('change', () => {
  loadElement();
});

loadElement();
