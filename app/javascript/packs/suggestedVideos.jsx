import { h, render } from 'preact';
import { SuggestedVideos } from '../SuggestedVideos/SuggestedVideos';

function loadElement() {
  const root = document.getElementById('suggested_videos');
  if (root) {
    const { videos } = root.dataset;
    render(
      <h1 className="container video-container">
        Suggested Videos!
        <SuggestedVideos
          videos={JSON.parse(videos)}
        />
      </h1>,
      root,
      root.firstElementChild,
    );
  }
}

window.InstantClick.on('change', () => {
  loadElement();
});

loadElement();
