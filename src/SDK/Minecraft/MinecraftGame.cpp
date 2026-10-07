//
// Created by vastrakai on 6/24/2024.
//

#include "MinecraftGame.hpp"
#include <map>
#include <memory>
#include <libhat/Access.hpp>
#include <SDK/OffsetProvider.hpp>
#include <Utils/MemUtils.hpp>

#include "UWP/BedrockPlatformUWP.hpp"
#include "UWP/MainView.hpp"

#include "ClientInstance.hpp"

MinecraftGame* MinecraftGame::getInstance(){
    static auto minecraftgame = reinterpret_cast<MinecraftGame**>(SigManager::MinecraftGame_instance);
    return *minecraftgame;
    /* // raped
    if (!MainView::getInstance() || !MainView::getInstance()->getBedrockPlatform() || !MainView::getInstance()->getBedrockPlatform()->getMinecraftGame())
        return nullptr;
    return MainView::getInstance()->getBedrockPlatform()->getMinecraftGame();*/
}

ClientInstance* MinecraftGame::getPrimaryClientInstance()
{ //fuckyou clang
    auto* b = (uint8_t*)this;
    void* he = *(void** )(b + OffsetProvider::MinecraftGame_mClientInstances);
    size_t size = *(size_t * )(b + OffsetProvider::MinecraftGame_mClientInstances+8);
    if (he == nullptr || size == 0)
        return nullptr;
    auto* n = *(uint8_t * *)he;
    if (*(char*)(n + 0x19) != 0)
        return nullptr;

    return *reinterpret_cast<ClientInstance**>(n + 0x30);
    /* i think it was fucked by clang :ultra_retard:
    auto helpme = hat::member_at<std::map<unsigned char, std::shared_ptr<class ClientInstance>>, MinecraftGame>(this, OffsetProvider::MinecraftGame_mClientInstances);

    for (auto& clientInstance : helpme)
    {
        return clientInstance.second.get();
    }

    return nullptr;*/
}

UIProfanityContext* MinecraftGame::getProfanityContext()
{
    return hat::member_at<UIProfanityContext*>(this, OffsetProvider::MinecraftGame_mProfanityContext);
}

bool MinecraftGame::getMouseGrabbed()
{
    return hat::member_at<bool>(this, OffsetProvider::MinecraftGame_mMouseGrabbed);
}

void MinecraftGame::setMouseGrabbed(bool grabbed)
{
    hat::member_at<bool>(this, OffsetProvider::MinecraftGame_mMouseGrabbed) = grabbed;
}
std::string MinecraftGame::getxuid()
{
    return *hat::member_at<std::string*>(this, OffsetProvider::MinecraftGame_mXuid);
}

void MinecraftGame::playUi(const std::string& soundName, float volume, float pitch)
{
    ClientInstance::get()->playUi(soundName, volume, pitch);
    /*
    int index = OffsetProvider::MinecraftGame_playUi;
    MemUtils::callVirtualFunc<void, const std::string&, float, float>(index, this, soundName, volume, pitch);*/
}
