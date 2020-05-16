import { h } from 'preact';
import PropTypes from 'prop-types';

// /* global timeAgo */

export const SuggestedVideos = ({ videos }) => {
  const createVideoElements = videos => {
    return videos.map(video => {
      const { id, snippet } = video;
      const { title, thumbnails } = snippet;
      return (
        <a href={`https://www.youtube.com/watch?v=${id.videoId}`} target="_blank">
          <img className="skip-lazy video-box" src={`${thumbnails.high.url}`} />
        </a>
      );
    });
  }
    return (
      <section className="video-carousel">
        {createVideoElements(videos)}
      </section>
    );
};

SuggestedVideos.defaultProps = {};

SuggestedVideos.propTypes = {};
