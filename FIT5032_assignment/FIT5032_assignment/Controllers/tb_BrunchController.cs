using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FIT5032_assignment.Models;

namespace FIT5032_assignment.Controllers
{
    public class tb_BrunchController : Controller
    {
        private Assignment_dbEntities1 db = new Assignment_dbEntities1();

        public ActionResult Index()
        {
            return View(db.tb_Brunch.ToList());
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_Brunch tb_Brunch = db.tb_Brunch.Find(id);
            if (tb_Brunch == null)
            {
                return HttpNotFound();
            }
            return View(tb_Brunch);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BrunchId,Name,Street,Suburb,CostForTwo,Hours,AverRating")] tb_Brunch tb_Brunch)
        {
            if (ModelState.IsValid)
            {
                db.tb_Brunch.Add(tb_Brunch);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tb_Brunch);
        }


        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_Brunch tb_Brunch = db.tb_Brunch.Find(id);
            if (tb_Brunch == null)
            {
                return HttpNotFound();
            }
            return View(tb_Brunch);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BrunchId,Name,Street,Suburb,CostForTwo,Hours,AverRating")] tb_Brunch tb_Brunch)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tb_Brunch).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tb_Brunch);
        }


        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_Brunch tb_Brunch = db.tb_Brunch.Find(id);
            if (tb_Brunch == null)
            {
                return HttpNotFound();
            }
            return View(tb_Brunch);
        }


        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tb_Brunch tb_Brunch = db.tb_Brunch.Find(id);
            db.tb_Brunch.Remove(tb_Brunch);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
