using praca2.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace praca2
{
    /// <summary>
    /// Summary description for DaneSerwis
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class DaneSerwis : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public void GetAllEmployee()
        {
            using (BazaCon db = new BazaCon())
            {
                JavaScriptSerializer js = new JavaScriptSerializer();
                Context.Response.Write(js.Serialize(db.Pracownik.ToList()));
            }



        }
        [WebMethod]
        public  string NowyPracownik(string imie,string nazwisko,string adres)
        {
            using (BazaCon db = new BazaCon())
            {
                Pracownik p = new Pracownik();
                p.imie = imie;
                p.nazwisko = nazwisko;
                p.adres = adres;
                db.Pracownik.Add(p);
                db.SaveChanges();
               
            }

            return "ok";
        }
        [WebMethod]
        public string UsunPracownik(int id)
        {
            using (BazaCon db = new BazaCon())
            {
                var p = db.Pracownik.FirstOrDefault(k => k.id == id);
                db.Pracownik.Remove(p);
                db.SaveChanges();

            }

            return "ok";
        }
    }
}
