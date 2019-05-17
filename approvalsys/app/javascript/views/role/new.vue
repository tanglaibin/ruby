<template>
  <row>
    <column class="col-md-2"></column>
    <column class="col-md-8">
        <role-form :role='role' title='New Role' @input='updateValue'></role-form>
        <va-button name="Register" theme="primary" :isBlock="false" @click="register"></va-button>
        <va-button name="Cancel" theme="warning" :isBlock="false" align="right" @click="cancel"></va-button>
    </column>
    <column class="col-md-2"></column>
  </row>
</template>

<script>
    import RoleForm from './_form'
    export default {
        name: "role-view-new",
        //common components are imported at lib/global.js
        //import form.vue
        components: {
            'role-form': RoleForm
        },
        methods: {
            updateValue(newValue, itemkey) {
                this.$set(this.role, itemkey , newValue);
            },
            register() {
                this.axios.post("/roles.json", {
                    requestParam: {
                        role: this.role
                    },
                    handleRes: (response) => {
                        //log response
                        console.log(response);
                        //back to index
                        this.alert.success(this, "Success.", ()=> {
                            this.$router.push({name: 'RoleIndex'});
                        });
                    },
                    handleError: error => {
                      console.log(error);
                      this.alert.error(this, error);
                    }
                });
            },
            cancel() {
                this.$router.push({name: 'RoleIndex'});
            }
        },
        computed: { },
        watch: { },
        //https://jp.vuejs.org/v2/api/#オプション-ライフサイクルフック
        created () { },
        mounted () { },
        // beforeRouteLeave (to, from, next) {
        //     const isLeave = window.confirm('Do you really want to leave? you have unsaved changes!')
        //     next(isLeave);
        // },
        data() {
            return {
                role: { }
            };
        }
    }
</script>

<style scoped>
</style>
