import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import axios from 'axios';

class App extends Component {
  constructor(props){
    super(props)
    this.state = { results: [] }
    this.getRequest = this.getRequest.bind(this);
    this.addList = this.addList.bind(this);
  }
  

  addList(elms){
    var companies = [];
    for (var i = 0; i < elms.length; i++) {
      var elm = JSON.parse(elms[i]);
      companies.push(elm)
    }
   console.log(companies) 
    this.setState({ results: companies })
  }

  getRequest(e){
    axios.get('/api/v1/shippers' + '?' + e.target.value)
      .then(json => {
        this.addList(json.data['companies'])
      }
      )
      .catch(error => console.log(error))
  }

  componentDidMount(){
  }

  render() {
  return (
    <div className="App">
      <input onBlur={this.getRequest}/>
    </div>
  )};
}

export default App;
