//
//  FeaturedCocktailsWidget.swift
//  FeaturedCocktailsWidget
//
//  Created by Josh Smith on 9/11/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), cocktail: Cocktail.random)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), cocktail: .random)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate) ?? Date.now
            let entry = SimpleEntry(date: entryDate, cocktail: Cocktail.random)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let cocktail: Cocktail
}

struct FeaturedCocktailsWidgetEntryView : View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        GeometryReader { frame in
            ZStack(alignment: .bottomLeading) {
                
                Image("\(entry.cocktail.name)-\((widgetFamily == .systemMedium || widgetFamily == .systemExtraLarge) ? "Hero" : "Square")")
                    .resizable()
                    .scaledToFill()
                    .frame(width: frame.size.width, height: frame.size.height, alignment: .center)
                    .clipped()
                
                VStack(alignment: .leading) {
                    
                    Text(entry.cocktail.category.name)
                        .font(subtitle)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .foregroundColor(.white)
                        .background(entry.cocktail.category.color)
                        .clipShape(Capsule())
                        .padding(padding)
                    
                    Spacer()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(entry.cocktail.name)
                                .foregroundColor(.white)
                                .font(titleSize.weight(.bold))
                                .shadow(radius: 5)
                            if widgetFamily != .systemSmall {
                                Text(entry.cocktail.flavorProfile)
                                    .font(subtitle)
                                    .foregroundColor(.white.opacity(0.7))
                                    .shadow(radius: 5)
                            }
                        }
                        Spacer()
                    }
                    .padding(padding)
                    .background(LinearGradient(colors: [.clear, .black.opacity(0.5), .black.opacity(0.75)], startPoint: .top, endPoint: .bottom))
                    
                }
                
            }
        }
        .widgetURL(entry.cocktail.url.absoluteURL)
    }
    
    var titleSize: Font {
        switch widgetFamily {
        case .systemSmall:
            return .title3
        case .systemMedium:
            return .title2
        case .systemLarge:
            return .largeTitle
        case .systemExtraLarge:
            return .largeTitle
        default: return .title3
        }
    }
    
    var subtitle: Font {
        switch widgetFamily {
        case .systemMedium:
            return .callout
        case .systemLarge:
            return .title3
        case .systemExtraLarge:
            return .title
        default: return .callout
        }
    }
    
    var padding: CGFloat {
        switch widgetFamily {
        case .systemSmall:
            return 10
        case .systemMedium:
            return 15
        case .systemLarge:
            return 15
        case .systemExtraLarge:
            return 20
        default: return 10
        }
    }
}

@main
struct FeaturedCocktailsWidget: Widget {
    let kind: String = "FeaturedCocktailsWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            FeaturedCocktailsWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Featured Cocktails")
        .description("Discover new cocktails every hour.")
    }
}

struct FeaturedCocktailsWidget_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCocktailsWidgetEntryView(entry: SimpleEntry(date: Date(), cocktail: Cocktail.random))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            .previewDisplayName("Small")
        FeaturedCocktailsWidgetEntryView(entry: SimpleEntry(date: Date(), cocktail: Cocktail.random))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .previewDisplayName("Medium")
        FeaturedCocktailsWidgetEntryView(entry: SimpleEntry(date: Date(), cocktail: Cocktail.random))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
            .previewDisplayName("Large")
        FeaturedCocktailsWidgetEntryView(entry: SimpleEntry(date: Date(), cocktail: Cocktail.random))
            .previewContext(WidgetPreviewContext(family: .systemExtraLarge))
            .previewDisplayName("Extra Large")
    }
}
