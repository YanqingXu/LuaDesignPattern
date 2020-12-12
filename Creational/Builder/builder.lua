--[[
	将一个复杂对象的构造与它的表示分离，使同样的构建过程可以创建不同的表示，这样的模式被称为建造者模式
	1 当创建复杂对象的算法应该独立于该对象的组成部分以及他们的装配方式时
	2 当构造过程必须允许被构造的对象有不同表示时
]]

Builder = {}

function Builder:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

PersonBuilder = Builder:new()

function PersonBuilder:buildHead()
end

function PersonBuilder:buildBody()
end

function PersonBuilder:buildArmLeft()
end

function PersonBuilder:buildArmRight()
end

function PersonBuilder:buildLegLeft()
end

function PersonBuilder:buildLegRight()
end

ThinPersonBuilder = PersonBuilder:new()

function ThinPersonBuilder:buildHead()
    print("building thin person's head")
end

function ThinPersonBuilder:buildBody()
    print("building thin person's body")
end

function ThinPersonBuilder:buildArmLeft()
    print("building thin person's left arm")
end

function ThinPersonBuilder:buildArmRight()
    print("building thin person's right arm")
end

function ThinPersonBuilder:buildLegLeft()
    print("building thin person's left leg")
end

function ThinPersonBuilder:buildLegRight()
    print("building thin person's right leg")
end

FatPersonBuilder = PersonBuilder:new()

function FatPersonBuilder:buildHead()
    print("building fat person's head")
end

function FatPersonBuilder:buildBody()
    print("building fat person's body")
end

function FatPersonBuilder:buildArmLeft()
    print("building fat person's left arm")
end

function FatPersonBuilder:buildArmRight()
    print("building fat person's right arm")
end

function FatPersonBuilder:buildLegLeft()
    print("building fat person's left leg")
end

function FatPersonBuilder:buildLegRight()
    print("building fat person's right leg")
end

PersonDirector = {}

function PersonDirector:new(pb)
    o = {}
    setmetatable(o, self)
    self.pb = pb
    self.__index = self
    return o
end

function PersonDirector:creatPerson()
    self.pb.buildHead()
    self.pb.buildBody()
    self.pb.buildArmLeft()
    self.pb.buildArmRight()
    self.pb.buildLegLeft()
    self.pb.buildLegRight()
end

local tpb = ThinPersonBuilder:new()
local director = PersonDirector:new(tpb)
director:creatPerson()

