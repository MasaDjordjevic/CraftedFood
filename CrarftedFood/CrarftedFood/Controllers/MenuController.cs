﻿using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CrarftedFood.Models;
using Data;
using Data.DTOs;

namespace CrarftedFood.Controllers
{
    public class MenuController : Controller
    {
        #region MENU

        public ActionResult Index()
        {
            MenuViewModel menu = new MenuViewModel();
            menu.menu = Data.Entities.Meals.GetMenu();
            return View(menu);
        }

        #endregion

        #region COMMENT

        public class CommentBindClass
        {
            public int? mealId;
            public string comment;
        }

        [HttpPost]
        public ActionResult CommentMeal(CommentBindClass model)
        {
            if (model == null || model.mealId == null || String.IsNullOrEmpty(model?.comment))
            {
                return Json(new { success = false, message = "incorrect parameters" });
            }

            Employee emp = UserSession.GetUser();
            Data.Entities.Meals.CommentMeal(emp.EmployeeId, model.mealId.Value, model.comment);

            return Json(new { success = true });

        }

        #endregion

        #region RATE

        public class RateBindClass
        {
            public int? mealId;
            public float? rating;
        }

        [HttpPost]
        public ActionResult RateMeal(RateBindClass model)
        {
            if (model == null || model.mealId == null || model.rating == null)
            {
                return Json(new { success = false, message = "incorrect parameters" });
            }

            Employee emp = UserSession.GetUser();
            Data.Entities.Meals.RateMeal(emp.EmployeeId, model.mealId.Value, model.rating.Value);
            float newrate = Data.Entities.Meals.GetAverageRate(model.mealId);
            return Json(new { success = true, newrateing =  newrate});
        } 

        #endregion

        #region ADD

        public ActionResult AddMeal()
        {
            //TODO View
            return View();
        }

        [HttpPost]
        public ActionResult AddMeal(MealViewModel model)
        {
            Data.Entities.Meals.AddMeal(model.Title, model.Description, model.Image, model.Price, model.Quantity, model.Unit, model.Category);
            return RedirectToAction("Index");
        }

        #endregion

        #region EDIT

        public ActionResult EditMeal(int mealId)
        {
            MealViewModel model = MealViewModel.Load(mealId);
            //TODO view
            return View(model);
        }

        [HttpPost]
        public ActionResult EditMeal(MealViewModel model)
        {
            Data.Entities.Meals.EditMeal(model.Id, model.Title, model.Description, model.Image, model.Price,
                model.Quantity, model.Unit, model.Category);
            return RedirectToAction("Index");
        }

        #endregion

        #region DELETE

        

        #endregion
    }
}