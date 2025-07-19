package org.example.WebServiceHW3.controller;

import org.example.WebServiceHW3.mapper.FurnitureMapper;
import org.example.WebServiceHW3.vo.FurnitureVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/todayHome")
public class FurnitureController {
    @Autowired
    private FurnitureMapper furnitureMapper;

    @GetMapping({"","/"})
    public String rootRedirect() {
        return "redirect:/todayHome/list";
    }

    @GetMapping("/list")
    public String furnitureList(Model model) {
        model.addAttribute("list", furnitureMapper.getList());
        return "todayHome/list";
    }

    @GetMapping("/write")
    public String writeForm() {
        return "todayHome/write";
    }

    @PostMapping("/write")
    public String write(FurnitureVO furnitureVO) {
        furnitureMapper.insert(furnitureVO);
        return "redirect:/todayHome/list";
    }

    @GetMapping("/view")
    public String view(@RequestParam int id, Model model) {
        model.addAttribute("furniture", furnitureMapper.getById(id));
        return "todayHome/view";
    }

    @GetMapping("/edit")
    public String edit_form(@RequestParam int id, Model model) {
        model.addAttribute("furniture", furnitureMapper.getById(id));
        return "todayHome/edit";
    }

    @PostMapping("/edit")
    public String update(FurnitureVO furniture) {
        furnitureMapper.update(furniture);
        return "redirect:/todayHome/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam int id) {
        furnitureMapper.delete(id);
        return "redirect:/todayHome/list";
    }
}
