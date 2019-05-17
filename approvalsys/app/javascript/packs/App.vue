<template>
  <div id="app" class="wrapper">
    <va-navibar></va-navibar>
    <va-slider :slideMenuItems="slideMenuItems"></va-slider>
    <va-content-wrap></va-content-wrap>
    <Modal></Modal>
  </div>
</template>

<script>
//top
import VANaviBar from "./NaviBar";
//left
import VASlider from './Slider'
//main
import VAContentWrap from './ContentWrap'
import Modal from './components/Modal.vue'

import store from "./vuex/store.js";
import slideMenuItems from "./lib/slideMenuItems.js";

export default {
  data: function() {
    return {
      slideMenuItems: slideMenuItems
    };
  },
  components: {
    "va-navibar": VANaviBar,
    'va-slider': VASlider,
    'va-content-wrap': VAContentWrap,
    Modal
  },
  store
};
</script>

<style scoped>

</style>
