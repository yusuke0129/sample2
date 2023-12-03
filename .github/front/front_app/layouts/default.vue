<template>
  <v-app dark>
    <v-navigation-drawer
      v-model="drawer"
      :mini-variant="miniVariant"
      :clipped="clipped"
      fixed
      app
    >
      <v-list>
        <v-list-item
          v-for="(item, i) in items"
          :key="i"
          :to="item.to"
          router
          exact
        >
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title v-text="item.title" />
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar :clipped-left="clipped" fixed app>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
      <v-btn icon @click.stop="miniVariant = !miniVariant">
        <v-icon>mdi-{{ `chevron-${miniVariant ? "right" : "left"}` }}</v-icon>
      </v-btn>
      <v-btn icon @click.stop="clipped = !clipped">
        <v-icon>mdi-application</v-icon>
      </v-btn>
      <v-btn icon @click.stop="fixed = !fixed" />
      <v-spacer />
      <v-dialog v-model="dialog" persistent max-width="600px">
        <template v-slot:activator="{ on, attrs }">
          <v-btn class="fuller-button" dark v-bind="attrs" v-on="on">
            Login
          </v-btn>
        </template>
        <v-card width="800px" class="mx-auto mt-5">
          <notification v-if="$store.state.text" class="mb-3" color="error">
            {{ $store.state.text }}
          </notification>
          <v-card-title>
            <h1 class="display-1">
              <span class="samrt-font">Sign in</span>
            </h1>
          </v-card-title>
          <v-card-text>
            <v-form>
              <v-text-field
                prepend-icon="mdi-account-circle"
                label="E-mail"
                :value="email"
                @input="onInputEmail"
              />
              <v-text-field
                :type="showPassword ? 'text' : 'password'"
                prepend-icon="mdi-lock"
                :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
                label="password"
                :value="password"
                @click:append="showPassword = !showPassword"
                @input="onInputPassword"
              />
              <v-card-actions>
                <v-btn
                  class="fuller-button"
                  style="margin: 0 auto"
                  :loading="loading"
                  @click="signup"
                >
                  Login
                </v-btn>
              </v-card-actions>
            </v-form>
          </v-card-text>
          <v-card-actions>
            <v-spacer />
            <v-btn color="blue darken-1" text @click="onCloseDialog">
              Close
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-app-bar>
    <v-main>
      <v-container>
        <nuxt />
      </v-container>
    </v-main>

    <v-footer :absolute="!fixed" app>
      <small>
        <em
          >COPYRIGHT &copy; {{ new Date().getFullYear() }} y_inomata ALL RIGHTS
          RESERVED.
        </em>
      </small>
    </v-footer>
  </v-app>
</template>

<script>
import { mapMutations } from "vuex"
import { $cookies, $cookiesOpt } from "~/plugins/cookies"
import notification from "~/components/notification"

export default {
  components: {
    notification,
  },
  data() {
    return {
      dialog: false,
      showPassword: false,
      loading: false,
      clipped: false,
      drawer: false,
      fixed: true,
      items: [
        {
          icon: "mdi-apps",
          title: "ホーム",
          to: "/",
        },
        {
          icon: "mdi-chart-bubble",
          title: "このアプリについて",
          to: "/about",
        },
        {
          icon: "mdi-login",
          title: "新規登録",
          to: "/new_regist",
        },
        {
          icon: "mdi-contacts",
          title: "問い合わせ",
          to: "/contact",
        },
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: "Vuetify.js",
      email: "",
      password: "",
    }
  },
  methods: {
    onCloseDialog() {
      this.dialog = false
      this.setMessage({ text: "" })
    },
    onInputEmail(email) {
      this.email = email
    },
    onInputPassword(password) {
      this.password = password
    },
    async signup() {
      this.loading = true
      let query = "?" + "email=" + this.email + "&password=" + this.password
      try {
        const res = await this.$axios.$post(
          `http://54.238.36.167:3000/api/auth/sign_in${query}`
        )

        $cookies.set("auth", true, $cookiesOpt)
        location.href = `/signup/${res.data.id}`
      } catch (e) {
        this.setMessage({ text: "アカウント情報が正しくありません" })
        return
      } finally {
        this.loading = false
      }
    },
    ...mapMutations(["setMessage"]),
  },
}
</script>
<style scoped>
.fuller-button {
  color: rgba(255, 255, 255, 1);
  background: none;
  border-radius: 0;
  padding: 1.2em 5em;
  letter-spacing: 0.35em;
  font-size: 0.7em;
  transition: background-color 0.3s, box-shadow 0.3s, color 0.3s;
  margin: 1em;
  box-shadow: inset 0 0 1em rgba(0, 170, 170, 0.5),
    0 0 1em rgba(0, 170, 170, 0.5);
  border: #0dd solid 2px;
  box-shadow: inset 0 0 1em rgba(0, 170, 170, 0.5),
    0 0 1em rgba(0, 170, 170, 0.5);
  border: #0dd solid 2px;
}

.fuller-button:hover {
  background-color: #0dd;
  box-shadow: inset 0 0 0 rgba(0, 170, 170, 0.5),
    0 0 1.5em rgba(0, 170, 170, 0.7);
}
</style>
