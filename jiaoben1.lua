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
  SN =gg.multiChoice({
  "2048透视",
  "全局加速",
  "4倍巨人",
  "无后",
  "57自瞄",
  "全局大范围",
  "快刀",
  "快刀关闭",
  "跳跃爬墙",
  "散弹聚点",
  "两连跳",
  "隔墙瞄准",
  "退出脚本"
 }, nil, "初少提示:两连跳脚本搜索的时候退出一起选择，直接断掉然后改善2，转到上面下面的0都试一下改成5.1就OK了，还有什么不会的联系初少qq2644283239")
  if SN == nil then
  else
  if SN[1] == true then
    a()
  end
  if SN[2] == true then
   b()
  end
  if SN[3] == true then
   c()
  end
  if SN[4] == true then
   d()
  end
  if SN[5] == true then
   e()
  end
  if SN[6] == true then
   f()
  end
  if SN[7] == true then
   g()
  end
  if SN[8] == true then
   h()
  end
  if SN[9] == true then
   i()
  end
  if SN[10] == true then
   j()
  end
  if SN[11] == true then
   k()
  end
  if SN[12] == true then
   l()
  end
  if SN[13] == true then
   Exit()
  end
end
  XGCK = -1
end



function a()
local tb1 = {{2048,0}, {1008981770,40}, {1148846080,44}, } 	
local tb2 = {{108800,0}, } 	
local dataType = 4
gg.setRanges(4) 
SearchWrite(tb1,tb2, dataType)
gg.toast("指针透视成功")
end



function b()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("76D;1;1000;1000::100", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1000)
gg.editAll("2", gg.TYPE_FLOAT)
gg.toast("全局加速开启成功")
end



function c()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('8191D;1;-1,431,655,766D;2.3694278e-38;0.77999997139::', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber('8191D;1::100', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber('1', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(9999)
gg.editAll('4', gg.TYPE_FLOAT)
gg.toast('开启成功')
end



function d()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('1,000.0F;1.0F;1,000.0F;1.0F::25', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber('1', gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
print('Replaced: ', gg.editAll('0', gg.TYPE_FLOAT))
gg.toast('无后已开启')
end



function e()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("57.29578018188;1000;0.5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("", gg.TYPE_FLOAT)
gg.toast("请手动修改57改99999 0.5改0")
end



function f()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("0.5;1;0.0001;2;4;0.00001::", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("1", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(5)
gg.editAll("3.2",gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("2;0.00001;90;90", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("0.00001", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(10)
gg.editAll("3.2",gg.TYPE_FLOAT)
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber('0.00001;-1.3092816e25;-9.4914432e20:9',gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.searchNumber('0.00001',gg.TYPE_FLOAT, false, gg.SIGN_EQUAL,0,-1)
gg.getResults(99)
gg.editAll('4', gg.TYPE_FLOAT)
gg.toast("开启成功")
end



function g()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("0.5F;1.0F;1000.0F::30", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.processResume()
gg.searchNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.processResume()
gg.getResults(1000)
gg.editAll("3.4e38", gg.TYPE_FLOAT)
gg.toast("快刀开启成功")
end



function h()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("0.5F;3.4e38F;1000.0F::30", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.processResume()
gg.searchNumber("3.4E38", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.processResume()
gg.getResults(1000)
gg.editAll("1", gg.TYPE_FLOAT)
gg.toast("快刀关闭成功")
end



function i()
gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber("184,549,368D;452,984,820D;1,051,772,663D;0",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("0",gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(10)
gg.editAll("10",gg.TYPE_FLOAT)
gg.toast("开启成功")
end



function j()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('1,065,353,216;1,036,831,949;1,077,936,128;1,036,831,949;1,077,936,128;1,045,220,557;1,084,227,584;1,069,547,520', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber('1,065,353,216', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(1000)
gg.editAll('3212836864', gg.TYPE_DWORD)
gg.toast('喷子聚点开启成功')
end


function k()
gg.clearResults()
gg.setRanges(4)
gg.searchNumber("0.001;16.73500061035;10;2;0.5::", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.searchNumber("", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(100)
gg.editAll("", gg.TYPE_FLOAT)
gg.toast("2转到有2个0改5.1")
end


function l()
gg.clearResults()
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("114D;476D;0;0:13", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber("0", gg.TYPE_FLOAT,false,gg.SIGN_EQUAL,0,-1)
gg.getResults(10)
gg.editAll("99",gg.TYPE_FLOAT)
gg.toast("隔墙瞄准开启成功")
end


function Exit()
print("初少nb")
os.exit()
end
cs = "初少nb"



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









