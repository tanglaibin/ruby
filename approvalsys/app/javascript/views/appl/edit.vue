<template>
  <row>
    <column class="col-md-2"></column>
    <column class="col-md-8">
        <appl-form :appl='appl' title='Edit Appl' @input='updateValue'></appl-form>
        <va-button name="Update" theme="primary" :isBlock="false" @click="update"></va-button>
        <va-button name="Cancel" theme="warning" :isBlock="false" align="right" @click="cancel"></va-button>
    </column>
    <column class="col-md-2"></column>
  </row>
</template>

<script>
    import ApplForm from './_form'
    export default {
        name: "appl-view-edit",
        //common components are imported at lib/global.js
        //import form.vue
        components: {
            'appl-form': ApplForm
        },
        methods: {
            updateValue(newValue, itemkey) {
                this.$set(this.appl, itemkey , newValue);
            },
            update() {
                this.axios.patch("/appls/" + this.$route.params.id + ".json", {
                    requestParam: {
                        appl: this.appl
                    },
                    handleRes: response => {
                        //log response
                        console.log(response);
                        //back to index
                        this.alert.success(this, "Success.", ()=> {
                            this.$router.push({name: 'ApplIndex'});
                        });
                    },
                    handleError: error => {
                      console.log(error);
                      this.alert.error(this, error);
                    }
                });
            },
            cancel() {
                this.$router.push({name: 'ApplIndex'});
            }
        },
        computed: { },
        watch: { },
        //https://jp.vuejs.org/v2/api/#オプション-ライフサイクルフック
        created () { },
        mounted () { 
            this.axios.get("/appls/" + this.$route.params.id + ".json", {
                handleRes: response => {
                    this.appl = response.data;
                }
            });
        },
        // beforeRouteLeave (to, from, next) {
        //     const isLeave = window.confirm('Do you really want to leave? you have unsaved changes!')
        //     next(isLeave);
        // },
        data() {
            return {
                appl: 
                {
                    id: '1',
                    user_id: 'MyString',
                    title: 'MyString',
                    state: '1',
                    description: 'MyText',
                    checked: 'false',
                }
            };
        }
    }
</script>

<style scoped>
</style>
