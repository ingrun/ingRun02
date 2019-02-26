package Controller;

import Po.FactorySite;
import Po.Goods;
import Service.OtherService;
import com.github.pagehelper.PageHelper;
import jdk.nashorn.internal.runtime.linker.LinkerCallSite;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class OtherController {
    @Autowired
    private OtherService otherService;

    //查找所有厂址
    @RequestMapping(value = "other/findAllUpCarSpot", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String findAllUpCarSpot(){
        List<FactorySite> factorySites = otherService.findAllFactorySite();
        JSONArray jsonArray = JSONArray.fromObject(factorySites);
        return jsonArray.toString();
    }

}
