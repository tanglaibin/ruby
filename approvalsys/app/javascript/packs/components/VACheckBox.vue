<template>
  <div v-if="isHorizontal" class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox" :disabled="isDisabled" v-model="_value_">
          {{ text }}
        </label>
      </div>
    </div>
  </div>
  <div v-else class="checkbox">
    <label>
      <input type="checkbox" :disabled="isDisabled" v-model="_value_">
      {{ text }}
    </label>
  </div>
</template>

<script>
export default {
  name: "va-checkbox",
  props: {
    text: {
      type: String,
      default: "Check me out"
    },
    checkedValue: {
      // type: String
    },
    isHorizontal: {
      type: Boolean,
      default: false
    },
    isDisabled: {
      type: Boolean,
      default: false
    },
    value: {
      // type: String
    }
  },
  created() {},
  methods: {
    updateValue: function(value) {
      this.$emit('change', value ? this.checkedValue : (typeof this.checkedValue === "boolean"? false: null));
    }
  },
  computed: {
    _value_: {
      get() {
        return this.value == this.checkedValue;
      },
      set(value) {
        this.updateValue(value)
      }
    }
  }
};
</script>
