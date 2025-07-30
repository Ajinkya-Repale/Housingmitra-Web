package com.MainApp.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.MainApp.Entity.Complaint;
import com.MainApp.Service.ComplaintService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ComplaintAddViewEditDelete {

    @Autowired
    ComplaintService cService;

    @RequestMapping("/add-complaint")
    public String addComplaint(@ModelAttribute Complaint c, Model model, HttpServletRequest req) {
        cService.addComplaint(c);
        return "redirect:/userhome";
    }

    @RequestMapping("/delete-complaint")
    public String handleDeleteComplaint(@RequestParam("complaintid") int complaintid) {
        cService.deleteComplaint(complaintid);
        return "redirect:/userhome";
    }
}
