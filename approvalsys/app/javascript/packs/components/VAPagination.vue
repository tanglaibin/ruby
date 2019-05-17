<template>
  <div class="box-tools pull-right" v-if="total_pages > 0">
    <ul class="pagination pagination-sm inline">
      <li class="page-item">
        <span class="page-link" @click="click(0)">&laquo;</span>
      </li>
      <li class="page-item" v-for="(page, index) in display_pages" :key="index">
        <span class="page-link" @click="click(page)" :class="{active: pageIndex == page}">{{page + 1}}</span>
      </li>
      <li class="page-item">
        <span class="page-link" @click="click(total_pages - 1)">&raquo;</span>
      </li>
    </ul>
    <div class="input-group input-group-sm inline" v-if="isShowNoInput">
      <input type="number" class="form-control page_number_text inline">
    </div>
  </div>
</template>

<script>
export default {
  name: "va-pagination",
  props: {
    // pagination: {
    //   type: Object,
    //   default: {}
    // },
    perPage: {
      type: Number,
      default: 25
    },
    totalCount: {
      type: Number,
      default: 0
    },
    pageIndex: {
      type: Number,
      default: 0
    },

    isShowNoInput: {
      type: Boolean,
      default: false
    }
  },
  methods: {
    click(page_index) {
      this.$emit('click', page_index);
    },
    calPages() {
      return Math.ceil(this.totalCount / this.perPage);
    }

  },
  computed: {
    total_pages() {
      return this.calPages();
    },
    display_pages() {
      const total_pages = this.calPages();
      const pages = 10;

      var from = Math.max(this.pageIndex - pages / 2, 0);
      var to =  Math.min(from + pages, total_pages);
      from = Math.max(Math.min(to - pages, to), 0);
      return Array.from({length: to - from}, (x,i) => i + from);
    }
  },
  created() {},
  data() {
      return {
      }
  }

};
</script>
<style scoped>
.page-item .page-link.active {
  background-color: #007bff;
  color: #fff;
}
.page-item .page-link {
  cursor:pointer;
}
.page_number_text {
    width: 3.5em;
    padding: 5px 0px 5px 5px;
    font-size: 12px;
    border-radius: 3px !important;
}
</style>

