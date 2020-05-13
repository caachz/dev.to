import { h } from 'preact';
import PropTypes from 'prop-types';

// /* global timeAgo */

export const SuggestedVideos = props => {
  return (
    <section className="video-carousel">
      <h3 className='video-box'>vid1</h3>
      <h3 className='video-box'>vid2</h3>
      <h3 className='video-box'>vid3</h3>
    </section>
  );
};

SuggestedVideos.defaultProps = {};

SuggestedVideos.propTypes = {};
