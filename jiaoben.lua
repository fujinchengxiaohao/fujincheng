gg.alert("欢迎加入京康反馈群", "复制群号")
gg.copyText("787981811")

function SearchWrite(Search, Write, Type)
    gg.clearResults()
    gg.setVisible(false)
    gg.searchNumber(Search[1][1], Type)
    local count = gg.getResultCount()
    local result = gg.getResults(count)
    gg.clearResults()
    local data = {} --用于保存有效结果
    local base = Search[1][2] --(0 或主特征码后三位)(用于计算相对主特征码的偏移)
    
   if (count > 0) then
        for i, v in ipairs(result) do
            v.isUseful = true --保存搜索到的地址信息(全部设定为true)
        end
        
        for k=2, #Search do
            local tmp = {}
            local offset = Search[k][2] - base --特征码偏移(副特征码后三位 - 主特征码后三位)
            local num = Search[k][1] --特征码
            
            for i, v in ipairs(result) do
                tmp[#tmp+1] = {} --添加项目
                tmp[#tmp].address = v.address + offset  --项目地址为主特征码地址+偏移量
                tmp[#tmp].flags = v.flags  --项目数据类型
            end
            
            tmp = gg.getValues(tmp) --刷新项目值
            
            for i, v in ipairs(tmp) do
                if ( tostring(v.value) ~= tostring(num) ) then --判断项目值与其他特征码是否一致
                    result[i].isUseful = false --不符合过滤条件设定为false
                end
            end
        end
  
        for i, v in ipairs(result) do
            if (v.isUseful) then --筛选出符合条件的主特征码地址
                data[#data+1] = v.address
            end
        end
        --------------内存写入
        if (#data > 0) then
          -- gg.toast("搜索到"..#data.."条数据")
           local t = {}
           local base = Search[1][2]
           for i=1, #data do
               for k, w in ipairs(Write) do
                   offset = w[2] - base
                   t[#t+1] = {}
                   t[#t].address = data[i] + offset
                   t[#t].flags = Type
                   t[#t].value = w[1]
                   --- 冻结项目添加到列表
                   if (w[3] == true) then
                       local item = {}
                       item[#item+1] = t[#t]
                       item[#item].freeze = true
                       gg.addListItems(item)
                   end
                   --- 不需要可以注释掉
               end
           end
           gg.setValues(t)
      --     gg.toast("已修改"..#t.."条数据")
           gg.addListItems(t)
        else
            gg.toast("无数据", false)
            return false
        end
    else
        gg.toast("Not Found")
        return false
    end
end

function Main()
SN = gg.multiChoice({
"人物透视<单>",
"人物自瞄<全>",
"枪械无后<全>",
"重击快刀<全>",
"关闭快刀<全>",
"伤害透视<全>",
"退出脚本"
}, nil, "京康稳定拦截反馈群787981811进群每天更新稳定拦截+脚本各种稳定🔥")
if SN == nil then else
if SN[1] == true then a() end
if SN[2] == true then b() end
if SN[3] == true then c() end
if SN[4] == true then d() end
if SN[5] == true then e() end
if SN[6] == true then f() end
if SN[7] == true then Exit() end
end XGCK = -1 end

function a()
local tb1 = {{2048,0}, {1008981770,40}, {1148846080,44}, } 	
local tb2 = {{109800,0}, } 	
local dataType = 4
gg.setRanges(4) 
SearchWrite(tb1,tb2, dataType)
gg.toast("透视开启成功")
end
function b()
local tb1 = {{57.29578018188,0}, {1000,8}, {0.5,16}, } 	
local tb2 = {{57295.78018188,0}, {1,8}, {0.1,16}, } 	
local dataType = 16
gg.setRanges(4) 
SearchWrite(tb1,tb2, dataType)
gg.toast("自瞄开启成功")
end
function c()
local tb1 = {{1000,0}, {1,8}, {1000,16}, {1,24}, } 	
local tb2 = {{0.3,8}, {0.3,24}, } 	
local dataType = 16
gg.setRanges(4) 
SearchWrite(tb1,tb2, dataType)
gg.toast("无后开启成功")
end
function d()
local tb1 = {{0.5,0}, {1,8}, {1000,16}, } 	
local tb2 = {{99999,8}, } 	
local dataType = 16
gg.setRanges(4) 
SearchWrite(tb1,tb2, dataType)
gg.toast("快刀开启成功")
end 
function e()
local tb1 = {{0.5,0}, {99999,8}, {1000,16}, } 	
local tb2 = {{1,8}, } 	
local dataType = 16
gg.setRanges(4) 
SearchWrite(tb1,tb2, dataType)
gg.toast("快刀关闭成功")
end
function f()
local tb1 = {{0.30000001192,0}, {9.6409334e-43,24}, } 	
local tb2 = {{10000,0}, } 	local dataType = 16
gg.setRanges(4) 
gg.toast("伤害透视开启成功")
SearchWrite(tb1,tb2, dataType)
end
function Exit()
os.exit()
end
while true do
  if gg.isVisible(true) then
    XGCK = 1
    gg.setVisible(false)
  end
  gg.clearResults()
  if XGCK == 1 then
    Main()
  end
end
Main() -->>函数入口