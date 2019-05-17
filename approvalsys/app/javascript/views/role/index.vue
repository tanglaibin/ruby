<template>
  <row>
    <va-box theme="box-info" title="Roles" :isBorder="true" widgetType>
      <va-pagination slot="pagination" :pageIndex="pagination.pageIndex" :totalCount="pagination.totalCount" @click="paging"></va-pagination>
      <div slot="content" class="table-responsive">
        <table class="table table-bordered table-hover dataTable">
          <thead>
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Code</th>
            </tr>
          </thead>
          <tbody>
            <router-link tag="tr" :to="{name: 'RoleEdit', params: {id: role.id}}" v-for="(role, index) in roles" :key="index">
              <td>{{role.id}}</td>
              <td>{{role.name}}</td>
              <td>{{role.code}}</td>
            </router-link>
          </tbody>
        </table>
      </div>
      <div class="box-footer clearfix" slot="footer">
        <router-link :to="{name: 'RoleNew'}" class="btn btn-sm btn-info btn-flat pull-left"><i class="fa fa-plus"></i> Add Role</router-link>
        <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Roles</a>
      </div>
    </va-box>
  </row>
</template>

<script>
    export default {
        name: "role-view-index",
        //common components are imported at lib/global.js
        components: {
        },
        methods: {
            paging(val) {
              this.pagination.pageIndex = val;
            },
            getData(page_no = 0){
              this.axios.get("/roles.json", {
                  requestParam: {
                  },
                  handleRes: response => {
                    //list result
                    this.roles = response.data;
                    this.pagination.totalCount = this.roles.length;
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
                roles: [
                    {
                        id: "1",
                        name: "MyString",
                        code: "MyString",
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
