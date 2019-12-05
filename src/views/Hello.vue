<template>
  <div class="hello">
    <h1>Wolf TEST REST</h1>
    <table>
      <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>City</th>
        <th>Job</th>
      </tr>
      <tr v-for="contact in contacts" :key="contact.id">
        <td>{{contact.name}}</td>
        <td>{{contact.email}}</td>
        <td>{{contact.country}}</td>
        <td>{{contact.city}}</td>
        <td>{{contact.job}}</td>
      </tr>
    </table>
    <br />
    <form name="form1" @submit.prevent="createContact">
      <label for>Name :</label>
      <input type="text" name="name" v-model="name" required />
      {{name}}
      <br />
      <hr />
      <label for>Email :</label>
      <span>{{msgError}}</span>
      <input type="email" name="email" v-model="email" required />
      {{email}}
      <br />
      <hr />
      <label for>Country :</label>
      <input type="text" name="country" v-model="country" required />
      {{country}}
      <br />
      <hr />
      <label for>City :</label>
      <input type="text" name="city" v-model="city" required />
      {{city}}
      <br />
      <hr />
      <label for>Job :</label>
      <input type="text" name="job" v-model="job" required />
      {{job}}
      <br />
      <hr />
      <input type="submit" name="submit" value="Ajout" />
    </form>
  </div>
</template>

<script>
import Vue from "vue";

export default {
  name: "Hello",
  data() {
    return {
      name: "",
      email: "",
      country: "",
      city: "",
      job: "",
      contacts: [],
      msgError: ""
    };
  },
  mounted() {
    this.getContact();
  },
  methods: {
    //hydratation des contact à partir de la base de données
    getContact() {
      console.log("get Contact");
      fetch("http://formation.xavier-loup.fr/tuto_api--s/api/contacts.php")
        .then(response => {
          response.json().then(json => {
            this.contacts = json.data;
          });
        })
        .catch(error => {
          console.log("Message d'erreur" + error.message);
        });
    },

    createContact() {
      console.log("Create Contact : " + this.name);
      let formData = new FormData();
      formData.append("name", this.name);
      formData.append("email", this.email);
      formData.append("country", this.country);
      formData.append("city", this.city);
      formData.append("job", this.job);
      formData.append("submit", true);

      fetch("http://formation.xavier-loup.fr/tuto_api--s/api/contacts.php", {
        method: "POST",
        body: formData
      })
        .then(response => {
          response.json().then(json => {
            if (json.ok) {
              app.contacts.push(json.data);
              this.resetForm();
            } else if (!json.ok) {
              this.rewriteContact(json);
            }
          });
        })
        .catch(error => {
          console.log("Message d'erreur" + error.message);
        });
    },
    rewriteContact(json) {
      this.name = json.data.name;
      this.msgError = "email déjà présent ! ";
      this.email = json.data.email;
      this.country = json.data.country;
      this.city = json.data.city;
      this.job = json.data.job;
    },
    resetForm() {
      this.name = "";
      this.email = "";
      this.country = "";
      this.city = "";
      this.job = "";
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scopped>
h1 {
  text-align: center;
  font-size: 1.5rem;
  color: #279f87;
}

table {
  width: 80%;
  margin: 20px auto;
  border: 1px;
  border-collapse: collapse;
}

.success {
  background-color: rgba(39, 159, 135, 0.4);
}

.error {
  background-color: rgba(200, 49, 79, 0.4);
}
</style>
