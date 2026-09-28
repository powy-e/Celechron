//
//  FlowWidgetView.swift
//  WidgetExtensions
//
//  Created by 施子捷 on 2024/5/13.
//

import WidgetKit
import SwiftUI

struct FlowWidgetView : View {
    let entry: FlowWidgetProvider.Entry

    @ViewBuilder
    var body: some View {
        if(entry.flows.isEmpty) {
            Text(NativeLanguage.text("今日无事可做", "Nothing scheduled today"))
                .font(.subheadline).bold()
        } else if(entry.flows.count == 1) {
            SingleFlowView(entry: entry)
        } else if(entry.flows.count == 2) {
            MultiFlowView(entry: entry)
        } else {
            Text(NativeLanguage.text("事情太多了", "Too many events"))
                .font(.subheadline).bold()
        }
    }
}

struct SingleFlowView: View {
    let entry: FlowWidgetProvider.Entry
    
    var body: some View {
        let flow = entry.flows.first!
        let hasBegun = entry.date.compare(flow.startTime!) != ComparisonResult.orderedAscending;
        let referenceTime = hasBegun ? flow.endTime! : flow.startTime!;
        let timeDifference = Int(ceil(entry.date.distance(to: referenceTime) / 60));
        let progress = hasBegun ? entry.date.distance(to: flow.startTime!) / flow.endTime!.distance(to: flow.startTime!) : 1
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "location").font(.caption2.bold())
                Spacer().frame(width: 5)
                Text(flow.location ?? NativeLanguage.text("无地点信息", "No location"))
                    .font(.caption2.bold()).lineLimit(1)
            }
            
            HStack {
                Circle().frame(height: 12)
                    .font(.subheadline).foregroundColor(.blue)
                Spacer().frame(width: 6)
                Text(flow.name ?? NativeLanguage.text("未命名日程", "Untitled event"))
                    .font(.subheadline.bold())
            }
            
            HStack(alignment: .lastTextBaseline) {
                Text(String(format: "%02d:%02d", arguments: [timeDifference / 60, timeDifference % 60]))
                    .font(.title.bold())
                Spacer().frame(width: 2)
                Text(hasBegun ? NativeLanguage.text("后结束", "until end") : NativeLanguage.text("后开始", "until start"))
                    .font(.caption2)
            }
            Spacer().frame(height: 0)
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(.gray.opacity(0.5)).frame(height: 12)
                GeometryReader { metrics in
                    RoundedRectangle(cornerRadius: 6)
                        .frame(width: metrics.size.width * (progress < 0.08 ? 0.08 : progress))
                        .frame(height: 12).foregroundColor(.blue)
                }
            }
            
            HStack {
                Text(entry.remaining == 0 ? NativeLanguage.text("今日已无更多事务", "No more events today")
                    : (NativeLanguage.code == "en" ? "\(entry.remaining) more today" : "今日还有\(entry.remaining)项事务"))
                    .font(.caption2).foregroundColor(.secondary).lineLimit(2)
            }
        }
    }
}

struct MultiFlowView: View {
    let entry: FlowWidgetProvider.Entry
    
    var body: some View {
        VStack {
            FlowCard(date: entry.date, flow: entry.flows[0]).background(Color(UIColor.secondarySystemGroupedBackground)).cornerRadius(12)
            FlowCard(date: entry.date, flow: entry.flows[1]).background(Color(UIColor.secondarySystemGroupedBackground)).cornerRadius(12)
        }
    }
    
    struct FlowCard: View {
        let date: Date
        let flow: Flow
        
        var body: some View {
            let hasBegun = date.compare(flow.startTime!) != ComparisonResult.orderedAscending;
            let referenceTime = hasBegun ? flow.endTime! : flow.startTime!;
            let timeDifference = Int(ceil(date.distance(to: referenceTime) / 60));
            let progress = hasBegun ? date.distance(to: flow.startTime!) / flow.endTime!.distance(to: flow.startTime!) : 1
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "location").font(.caption2.bold())
                    Spacer().frame(width: 4)
                    Text(flow.location ?? NativeLanguage.text("无地点信息", "No location"))
                        .font(.caption2.bold()).lineLimit(1)
                }
                
                HStack {
                    Image(systemName: "circle.fill").font(.caption2.bold())
                        .foregroundColor(.blue)
                    Spacer().frame(width: 4)
                    Text(flow.name ?? NativeLanguage.text("未命名日程", "Untitled event"))
                        .font(.caption).bold()
                }
                
                Spacer().frame(height: 2)
                
                HStack {
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 6)
                            .frame(height: 6).foregroundColor(.gray.opacity(0.5))
                        GeometryReader { metrics in
                            RoundedRectangle(cornerRadius: 6)
                                .frame(width: metrics.size.width * (progress < 0.08 ? 0.08 : progress))
                                .frame(height: 6).foregroundColor(.blue)
                        }
                    }.frame(maxHeight: 0)
                    Text(String(format: "%02d:%02d", arguments: [timeDifference / 60, timeDifference % 60]))
                        .font(.caption2.bold())
                    Spacer().frame(width: 1)
                    Text(hasBegun ? NativeLanguage.text("终", "End") : NativeLanguage.text("始", "Start"))
                        .font(.caption2.bold())
                }
                
            }
            .frame(maxHeight: .infinity).frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 6, leading: 6, bottom: 4, trailing: 6))
        }
    }
}

@available(iOS 18.0, *)
#Preview(as: .systemSmall) {
    FlowWidget()
} timeline: {
    FlowEntry(refreshAt: Date(), toDisplay: [Flow(location: NativeLanguage.text("紫金港西1-216", "Zijingang West 1-216"), name: NativeLanguage.text("信号与系统", "Signals and Systems"), startTime: Date().addingTimeInterval(-3600), endTime: Date().addingTimeInterval(1500))], stillToDoToday: 0)
}
