import React, { Component } from 'react';
import GoogleMap from './GoogleMap';
import logo from './logo.svg';
import './App.css';
import axios from 'axios';

class App extends Component {
  constructor(props){
    super(props)
    this.state = { results: [] }
    this.getRequest = this.getRequest.bind(this);
    this.addList = this.addList.bind(this);
    this.setMarkers = this.setMarkers.bind(this);
  }
  
  addList(elms){
    var companies = [];
    for (var i = 0; i < elms.length; i++) {
      var elm = JSON.parse(elms[i]);
      companies.push(elm)
    }
    this.setState({ results: companies })
  }

  getRequest(e){
    var keywords = e.target.value.replace(" ","+");
    axios.get('/api/v1/shippers' + '?keywords=' + keywords)
      .then(json => this.addList(json.data['companies']))
      .catch(error => console.log(error))
  }

  setMarkers(map){
    for (var i = 0; i < this.state.results.length; i++){
          var company = this.state.results[i];
          var company_address = company.results.address;
          console.log(company);
          if (company_address != null) {
            var marker = new window.google.maps.Marker({
            position: { lat: company_address.latitude, lng: company_address.longitude },
            map: map,
            title: company.results.name 
            });
          }
    }
  }

  componentDidMount(){
  }

  componentDidUpdate(prevProps, prevState){
    this.setMarkers(window.map)
    window.google.maps.event.trigger(window.map, 'resize');
  }

  render() {
  return (
    <div className="App">
      <input onBlur={this.getRequest}/>
      <GoogleMap id="myMap" 
          options={{
          center: { lat: 41.0082, lng: 28.9784 },
          zoom: 1 
          }}
          onMapLoad={map => this.setMarkers(map)}
      />
    </div>
  )};
}

export default App;
