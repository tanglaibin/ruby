<template>
  <va-box :title="title" theme="box-primary" :isBorder="true" widgetType>
    <div slot="content">
        <va-input-group title="Name" vaId="name" type="text" placeholder="Enter Name" :value="role.name" @input=" value => updateValue(value, 'name')">
        </va-input-group>
        <va-input-group title="Code" vaId="code" type="text" placeholder="Enter Code" :value="role.code" @input=" value => updateValue(value, 'code')">
        </va-input-group>
    </div>
  </va-box>
</template>
<script>
    export default {
        name: "role-view-form",
        props: {
            role: {
                type: Object
            },
            title: {
                type: String,
                default: ""
            }
        },
        //common components are imported at lib/global.js
        components: { },
        methods: {
            updateValue(newValue, itemKey) {
                this.$emit('input', newValue, itemKey);
            }
        },
        computed: { },
        watch: { },
        //https://jp.vuejs.org/v2/api/#オプション-ライフサイクルフック
        created() { },
        mounted() { },
        data() {
            return {
            };
        }
    }
</script>

<style scoped>
</style>
