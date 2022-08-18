import Vue from 'vue/dist/vue.esm';
import axios from 'axios';

axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};

new Vue({
  el: '#hamburger-app',
  data: {
    open: false
  }
})

new Vue({
  el: '#example_form',
  data: {
    selectedIndust: '',
    occupations: [],
    industries: JSON.parse(gon.industries)
  },
  methods: {
    getOccupations: function(industry) {
      axios
        .post('/set_occupations', {
          id: industry
        })
        .then((response) => {
          this.occupations = response.data
        })
    }
  }
});
