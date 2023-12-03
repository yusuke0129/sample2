<template>
  <v-layout>
    <v-flex class="text-center">
      <v-form ref="form" v-model="valid" lazy-validation>
        <v-text-field
          v-model="name"
          :counter="10"
          :rules="nameRules"
          label="Name"
          required
        />

        <v-text-field
          v-model="email"
          :rules="emailRules"
          label="E-mail"
          required
        />

        <v-container fluid>
          <v-textarea
            v-model="context"
            clearable
            clear-icon="mdi-close-thick"
            label="Text"
            value="This is clearable text."
          />
        </v-container>

        <v-btn class="fuller-button2" @click="send_mail"> Send </v-btn>
      </v-form>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  name: "App",
  data: () => ({
    valid: true,
    name: "",
    nameRules: [
      (v) => !!v || "Name is required",
      (v) => (v && v.length <= 10) || "Name must be less than 10 characters",
    ],
    email: "",
    emailRules: [
      (v) => !!v || "E-mail is required",
      (v) => /.+@.+\..+/.test(v) || "E-mail must be valid",
    ],
    context: "",
  }),
  methods: {
    async send_mail() {
      let query =
        "?" +
        "name=" +
        this.name +
        "&email=" +
        this.email +
        "&context=" +
        this.context
      const res = await this.$axios.$post(
        `http://54.238.36.167:3000/contacts${query}`
      )
      const errors = res.errors
      if (errors) {
        let error_message = ""
        Object.keys(errors).forEach(function (message) {
          error_message += errors[message] + "\n"
        }, errors)
        alert(error_message)
      } else {
        alert("お問い合わせを正常に受理しました")
      }
    },
  },
}
</script>
<style scoped>
.fuller-button2 {
  color: #ffa260;
  background: none;
  border-radius: 0;
  padding: 1.2em 5em;
  letter-spacing: 0.35em;
  font-size: 0.7em;
  transition: background-color 0.3s, box-shadow 0.3s, color 0.3s;
  margin: 1em;
  box-shadow: inset 0 0 1em rgba(0, 170, 170, 0.5),
    0 0 1em rgba(0, 170, 170, 0.5);
  border: #ffa260 solid 2px;
}

.fuller-button2:hover {
  background-color: #ffa260;
  box-shadow: inset 0 0 0 rgba(0, 170, 170, 0.5),
    0 0 1.5em rgba(0, 170, 170, 0.7);
}
</style>
