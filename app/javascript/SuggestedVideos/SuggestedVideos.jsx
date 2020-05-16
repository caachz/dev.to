import { h, Component } from 'preact';
import PropTypes from 'prop-types';


// /* global timeAgo */

export class SuggestedVideos extends Component {
  constructor(props) {
    super(props)
    this.state = {
      videos: []
    }
  }

  componentDidMount() {
    this.setState({videos:this.props.videos})
  }

  advanceCarousel = () => {
    const { videos } = this.state
    let head = videos[0]
    let tail = videos.slice(1)
    console.log(head.snippet.title);
    this.setState({videos: [...tail, head]})
  }

  recedeCarousel = () => {
    const { videos } = this.state
    let head = videos.slice(0, videos.length - 1)
    let tail = videos[videos.length - 1]
    console.log(tail.snippet.title);
    this.setState({videos: [tail, ...head]})
  }

  createVideoElements = videos => {
    return videos.map(video => {
      const { id, snippet } = video;
      const { title, thumbnails } = snippet;
      return (
        <a href={`https://www.youtube.com/watch?v=${id.videoId}`} target="_blank">
          <h5 className='title'>{snippet.title}</h5>
          <img className="skip-lazy video-box" src={`${thumbnails.high.url}`} />
        </a>
      );
    });
  }
  render() {
      const { videos } = this.state
    return (
      <section className="video-carousel">
        <button type='button' onClick={this.recedeCarousel}>＜</button>
        {this.createVideoElements(videos.slice(0,3))}
        <button type='button' onClick={this.advanceCarousel}>＞</button>
      </section>
    );
  }
};

SuggestedVideos.defaultProps = {
  videos: []
};

SuggestedVideos.propTypes = {};
