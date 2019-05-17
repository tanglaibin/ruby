<template>
  <row>
    <va-box theme="box-info" title="Appls" :isBorder="true" widgetType>
      <va-pagination slot="pagination" :pageIndex="pagination.pageIndex" :totalCount="pagination.totalCount" @click="paging"></va-pagination>
      <div slot="content" class="table-responsive">
        <table class="table table-bordered table-hover dataTable">
          <thead>
            <tr>
              <th>Id</th>
              <th>User</th>
              <th>Title</th>
              <th>State</th>
              <th>Description</th>
              <th>Checked</th>
            </tr>
          </thead>
          <tbody>
            <router-link tag="tr" :to="{name: 'ApplEdit', params: {id: appl.id}}" v-for="(appl, index) in appls" :key="index">
              <td>{{appl.id}}</td>
              <td>{{appl.user_id}}</td>
              <td>{{appl.title}}</td>
              <td>{{appl.state}}</td>
              <td>{{appl.description}}</td>
              <td>{{appl.checked}}</td>
            </router-link>
          </tbody>
        </table>
      </div>
      <div class="box-footer clearfix" slot="footer">
        <router-link :to="{name: 'ApplNew'}" class="btn btn-sm btn-info btn-flat pull-left"><i class="fa fa-plus"></i> Add Appl</router-link>
        <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Appls</a>
      </div>
    </va-box>
  </row>
</template>

<script>
    export default {
        name: "appl-view-index",
        //common components are imported at lib/global.js
        components: {
        },
        methods: {
            paging(val) {
              this.pagination.pageIndex = val;
            },
            getData(page_no = 0){
              this.axios.get("/appls.json", {
                  requestParam: {
                  },
                  handleRes: response => {
                    //list result
                    this.appls = response.data;
                    this.pagination.totalCount = this.appls.length;
                  },
                  handleError: error => {
                    console.log(error);
                    this.alert.error(this, error);
                  }
              });
            }
        },
        computed: { },
        watch: { },
        //https://jp.vuejs.org/v2/api/#オプション-ライフサイクルフック
        created () { },
        mounted () { 
          this.getData();
        },
        data() {
            return {
                appls: [
                    {
                        id: "1",
                        user_id: "MyString",
                        title: "MyString",
                        state: "1",
                        description: "MyText",
                        checked: "false",
                    }
                ],
                pagination :{
                  pageIndex: 0,
                  totalCount: 0
                }
            };
        }
    };
</script>

<style scoped>
</style>
