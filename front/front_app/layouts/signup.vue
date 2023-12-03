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

      <v-btn class="fuller-button" dark @click="logout"> Logout </v-btn>
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
import { mapGetters } from "vuex"
import { $cookies, $cookiesOpt } from "~/plugins/cookies"
export default {
  data() {
    return {
      clipped: false,
      drawer: false,
      fixed: true,
      items: [
        {
          icon: "mdi-book",
          title: "profile",
          to: `/signup/${this.$route.params.id}`,
        },
        {
          icon: "mdi-folder-outline",
          title: "works",
          to: "/signup/works",
        },
        {
          icon: "mdi-apps",
          title: "sample",
          to: "/signup/sample",
        },
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: "Vuetify.js",
    }
  },
  computed: {
    ...mapGetters(["name"]),
  },
  methods: {
    logout() {
      $cookies.remove("auth", $cookiesOpt)
      location.href = "/"
    },
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
