import React from 'react';
import style from '../css/latest.module.css';
import TopFour from './TopFour.jsx';
import ModalWindow from './ModalWindow.jsx';

class LatestReviews extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    console.log(this.props.reviews);
    return (
      <div className={style.view}>
        <h4 className={style.latest}>Latest Reviews</h4>
        <TopFour reviews={this.props.reviews} />
        <ModalWindow />
      </div>
    )
  }
};

export default LatestReviews;